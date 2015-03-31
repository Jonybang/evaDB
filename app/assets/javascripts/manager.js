// = require d3.min.js
// = require d3textwrap.v0
// = require gantt-chart-d3v2

$(document).on("ready page:load", function(){
    if(!$('#cabinet').length)
        return;

    var api_url = "http://192.168.153.132:3000/";
    App = Ember.Application.create({});

    App.Router.map(function() {
        //this.resource('about');
        this.resource('main');
        this.resource('projects');
        this.resource('project', { path: '/project/:project_id' }, function() {
//        this.route('index', { path: '/project/:project_id/index' });
            this.resource('tasks');
            this.resource('team');
            this.resource('resources');
        });
//    this.resource('projects', function() {
//        this.resource('project', { path: ':post_id' });
//    });
    });
    App.MainRoute = Ember.Route.extend({
        model: function(){
            return Ember.$.getJSON(api_url + "users/" + Ember.$("#user-id").val()+".json").success(function(data){
                var contacts = ['contact', 'student', 'partner', 'scientist'];
                contacts.map(function(name){
                    if(data[name]){
                        Ember.$.extend(data, data[name]);
                        data[name] = {};
                    }
                });
                return data;
            });
        }
    });
    App.IndexRoute = Ember.Route.extend({
        redirect: function() {
            return this.transitionTo('main');
        }
    });
    App.TeamRoute = Ember.Route.extend({
        model: function() {
            var parent = this.modelFor("project");
            return parent.contacts.map(function(obj, i){
                parent.contacts[i].idx = i + 1;
                return parent.contacts[i];
            });;
        }
    });
    App.ResourcesRoute = Ember.Route.extend({
        model: function() {
            var parent = this.modelFor("project");
            return parent.project_resources.map(function(obj, i){
                parent.project_resources[i].idx = i + 1;
                return parent.project_resources[i];
            });;
        }
    });
    var collections = {
        "Projects":{controller:"projects"},
        "Project":{controller:"projects", id_name: "project_id"},
        "Tasks":{controller:"project_tasks", parent: "project", init:
            function(tasks, transition) {
//                initGant(tasks);
            }
        }
    };
    Object.keys(collections).forEach(function (name) {
        var route_data = collections[name];
        App[name+"Route"] = Ember.Route.extend({
            model: function(params) {
                var url ="";
                if(route_data.parent){
                    var parentModel = this.modelFor(route_data.parent);
                    url = api_url + route_data.parent+"s/" + parentModel.id + "/"+route_data.controller + ".json";
                }
                else if(route_data.id_name){
                    url = api_url + route_data.controller + "/" +  params[route_data.id_name] + ".json";
                }
                else{
                    url = api_url + route_data.controller + ".json";
                }
                return Ember.$.getJSON(url).success(function(data){
                    if(data.length)
                        return data.map(function(obj, i){
                            data[i].idx = i + 1;
                        });
                    else
                        return data;
                });
            },
            init: route_data.init,
            setupController: function (controller, model) {
                controller.set('model', model);
            }
        });
    });
    App.TasksView = Ember.View.extend({
        didInsertElement: function() {
            Ember.run.scheduleOnce('afterRender', this, 'initialGant');
        },
        initialGant: function() {
            var model = this.get('controller.model');
            setTimeout(function() {
                initGant(model);
            }, 1);
        }
    });
});
function initGant(initTasks){
//    var tasks = [
//        {"startDate":new Date("Sun Dec 09 01:36:45 EST 2012"),"endDate":new Date("Sun Dec 09 02:36:45 EST 2012"),"taskName":"E Job","status":"RUNNING"}];
    var taskStatus = {};
    var taskNames = [];
    var tasks = initTasks.map(function(item){
        var task ={
            "startDate":new Date(item.begin_date),
            "endDate":new Date(item.end_date),
            "taskName": item.contact.name,
            "status": item.project_status.name,
            "title": item.name
        }
        function searchTaskName(task_name){
            return task_name == item.contact.name;
        }
        if(!taskNames.some(searchTaskName)){
            taskNames.push(item.contact.name);
        }
        if(!taskStatus[item.project_status.name]){
            taskStatus[item.project_status.name] = "bar-" + item.project_status.color;
        }
        return task;
    });
//    var taskStatus = {
//        "SUCCEEDED" : "bar",
//        "FAILED" : "bar-failed",
//        "RUNNING" : "bar-running",
//        "KILLED" : "bar-killed"
//    };
//
//    var taskNames = [ "D Job", "P Job", "E Job", "A Job", "N Job" ];

    tasks.sort(function(a, b) {
        return a.endDate - b.endDate;
    });
    var maxDate = tasks[tasks.length - 1].endDate;
    tasks.sort(function(a, b) {
        return a.startDate - b.startDate;
    });
    var minDate = tasks[0].startDate;

    var format = "%H:%M";
    var timeDomainString = "2month";

    var gantt = d3.gantt()
        .taskTypes(taskNames)
        .taskStatus(taskStatus)
        .tickFormat(format)
        .height(taskNames.length*70)
        .width(document.getElementById('gant').offsetWidth-120);


    gantt.timeDomainMode("fixed");
//    changeTimeDomain(timeDomainString);

    gantt(tasks);

    window.changeTimeDomain = function (timeDomainString) {
        this.timeDomainString = timeDomainString;
        switch (timeDomainString) {
            case "1hr":
                format = "%H:%M:%S";
                gantt.timeDomain([ d3.time.hour.offset(getEndDate(), -1), getEndDate() ]);
                break;
            case "3hr":
                format = "%H:%M";
                gantt.timeDomain([ d3.time.hour.offset(getEndDate(), -3), getEndDate() ]);
                break;

            case "6hr":
                format = "%H:%M";
                gantt.timeDomain([ d3.time.hour.offset(getEndDate(), -6), getEndDate() ]);
                break;

            case "1day":
                format = "%H:%M";
                gantt.timeDomain([ d3.time.day.offset(getEndDate(), -1), getEndDate() ]);
                break;

            case "1week":
                format = "%d";
                gantt.timeDomain([ d3.time.day.offset(getEndDate(), -7), getEndDate() ]);
                break;

            case "1month":
                format = "%d";
                gantt.timeDomain([ d3.time.month.offset(getEndDate(), -1), getEndDate() ]);
                break;

            case "2month":
                format = "%d %b";
                gantt.timeDomain([ d3.time.month.offset(getEndDate(), -2), getEndDate() ]);
                break;

            case "6month":
                format = "%d %b";
                gantt.timeDomain([ d3.time.month.offset(getEndDate(), -6), getEndDate() ]);
                break;
            default:
                format = "%H:%M"

        }
        gantt.tickFormat(format);
        gantt.redraw(tasks);
    }
    window.changeTimeDomain("2month");

    function getEndDate() {
        var lastEndDate = Date.now();
        if (tasks.length > 0) {
            lastEndDate = tasks[tasks.length - 1].endDate;
        }

        return lastEndDate;
    }

    window.addTask = function () {

        var lastEndDate = getEndDate();
        var taskStatusKeys = Object.keys(taskStatus);
        var taskStatusName = taskStatusKeys[Math.floor(Math.random() * taskStatusKeys.length)];
        var taskName = taskNames[Math.floor(Math.random() * taskNames.length)];

        tasks.push({
            "startDate" : d3.time.day.offset(lastEndDate, Math.ceil(1 * Math.random())),
            "endDate" : d3.time.day.offset(lastEndDate, (Math.ceil(Math.random() * 5)) + 1),
            "taskName" : taskName,
            "status" : taskStatusName
        });

        changeTimeDomain(timeDomainString);
        gantt.redraw(tasks);
    };

    window.removeTask = function () {
        tasks.pop();
        changeTimeDomain(timeDomainString);
        gantt.redraw(tasks);
    };

};
//
//App.PostController = Ember.ObjectController.extend({
//    isEditing: false,
//
//    actions: {
//        edit: function() {
//            this.set('isEditing', true);
//        },
//
//        doneEditing: function() {
//            this.set('isEditing', false);
//        }
//    }
//});
//
//var showdown = new Showdown.converter();
//
//Ember.Handlebars.helper('format-markdown', function(input) {
//    return new Handlebars.SafeString(showdown.makeHtml(input));
//});
//
//Ember.Handlebars.helper('format-date', function(date) {
//    return moment(date).fromNow();
//});