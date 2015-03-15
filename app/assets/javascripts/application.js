// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.validate.min
//= require jquery_nested_form
//= require select2
//= require select2_locale_ru
//= require handlebars.min
//= require ember-template-compiler
//= require ember.min
//= require bootstrap
//= require bootstrap-formhelpers.min
//= require bootstrap-formhelpers-phone
//= require turbolinks
//= require_tree .

$(document).on("ready page:load", function(){
    $('.eva-select').select2();
    $("form").validate();
    $("input[type='url']").keydown(function() {
        if(!this.value || this.value == "http:/" || this.value == "https:/"){
            this.value = '';
            return;
        }

        if (!/^https?:\/\//.test(this.value)) {
            this.value = "http://" + this.value;
        }
    });
});
