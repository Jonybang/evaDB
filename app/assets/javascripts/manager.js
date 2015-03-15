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
            return parent.resources.map(function(obj, i){
                parent.resources[i].idx = i + 1;
                return parent.resources[i];
            });;
        }
    });
    var collections = {
        "Projects":{controller:"projects"},
        "Project":{controller:"projects", id_name: "project_id"},
        "Tasks":{controller:"project_tasks", parent: "project"}
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
            }
        });
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