$(document).on("ready page:load", function(){
    if(!$('#cabinet').length)
        return;

    App = Ember.Application.create({});

    App.Router.map(function() {
        //this.resource('about');
        this.resource('projects');
        this.resource('project', { path: '/project/:project_id' }, function() {
//        this.route('index', { path: '/project/:project_id/index' });
            this.resource('tasks');
        });
//    this.resource('projects', function() {
//        this.resource('project', { path: ':post_id' });
//    });
    });
    App.IndexRoute = Ember.Route.extend({
        redirect: function() {
            return this.transitionTo('projects');
        }
    });
    var collections = {
        "Projects":{controller:"projects", object: "project"}
    };
    Object.keys(collections).forEach(function (name) {
        var route_data = collections[name];
        App[name+"Route"] = Ember.Route.extend({
            model: function(params) {
                var url = "http://192.168.153.132:3000/"+route_data.controller+".json";
                return Ember.$.getJSON(url).success(function(data) {
                    return data.map(function(proj, idx){
                        data[idx] = data[idx][route_data.object];
                        data[idx].id = data[idx].id['$oid'];
                        return true;
                    });
                });
            }
        });
    });
    App.TasksRoute = Ember.Route.extend({
        model: function() {
            var parentModel = this.modelFor('project');
            var url = "http://192.168.153.132:3000/projects/" + parentModel.id + "/project_tasks.json";
            return Ember.$.getJSON(url).success(function(data) {
                return data.map(function(proj, idx){
                    data[idx] = data[idx].project_task;
                    data[idx].id = data[idx].id['$oid'];
                    return true;
                });
            });
        }
    });

    App.ProjectRoute = Ember.Route.extend({
        model: function(params) {
            return Ember.$.getJSON("http://192.168.153.132:3000/projects/" + params.project_id + ".json").success(function( data ) {
                data = data.project;
                data.id = data.id['$oid'];
                return data;
            });
        },
        afterModel: function(data) {
            if (data.project) {
                Ember.$.extend( data, data.project );
                data.project = {};
            }
        }
    });
});
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