//= require_tree ./adapters
//= require_tree ./mixins
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./components
//= require_tree ./templates
//= require_tree ./routes
//= require ./router
//= require_self

var api_url = "http://192.168.153.132:3000/";

EvaDB.Router.map(function() {
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
EvaDB.MainRoute = Ember.Route.extend({
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
EvaDB.IndexRoute = Ember.Route.extend({
    redirect: function() {
        return this.transitionTo('main');
    }
});