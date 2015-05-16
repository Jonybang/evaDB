// = require jquery
// = require jquery_ujs
// = require handlebars
// = require ember
// = require d3.min.js
// = require d3textwrap.v0
// = require gantt-chart-d3v2
// = require_self
// = require eva_db

// for more details see: http://emberjs.com/guides/application/
Ember.Handlebars.helper('_if', function(value, one, two) {
    var result = '';
    if(value)
        result = one;
    else
        result = (typeof two == 'string') ? two : '';

    return new Ember.Handlebars.SafeString(result);
});

window.EvaDB = Ember.Application.create({
    rootElement: '#eva_db',
    LOG_TRANSITIONS: true,
    LOG_TRANSITIONS_INTERNAL: true,
    LOG_VIEW_LOOKUPS: true
});