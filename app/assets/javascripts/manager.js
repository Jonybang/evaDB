
App = Ember.Application.create({});

App.Router.map(function() {
    //this.resource('about');
    this.resource('projects');
    this.resource('project', { path: ':project_id' });
});
App.IndexRoute = Ember.Route.extend({
    redirect: function() {
        return this.transitionTo('projects');
    }
});
App.ProjectsRoute = Ember.Route.extend({
    model: function() {
       return $.getJSON( "http://192.168.153.132:3000/projects.json", function( data ) {
            return data.map(function(proj){
                proj = proj.project;
                proj.id = proj.id['$oid'];
                return proj;
            });
        });
        //return [{"project":{"id":{"$oid":"54b63de2756275148a0e0000"},"name":"project1","description":"desc","project_status":{"id":{"$oid":"54c88abe7562751a0b040000"},"name":"Активен"},"project_direction":{"id":{"$oid":"54c88b0a7562751a0b0a0000"},"name":"Направление 1"}}},{"project":{"id":{"$oid":"54ca491275627519b2050000"},"name":"проект 2","description":"выв","project_status":{"id":{"$oid":"54c88abe7562751a0b040000"},"name":"Активен"},"project_direction":{"id":{"$oid":"54c88b0a7562751a0b0a0000"},"name":"Направление 1"}}}];
    }
});

App.ProjectRoute = Ember.Route.extend({
    model: function(params) {
        return $.getJSON( "http://192.168.153.132:3000/projects/"+params.project_id+".json", function( data ) {
            data.id = data.id['$oid'];
            return data;
        });
    }
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