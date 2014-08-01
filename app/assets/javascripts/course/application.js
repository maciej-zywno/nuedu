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
//= require bootstrap
//= require holderjs
//= require turbolinks
//= require s3_direct_upload
//= require bootstrap.file-input
//= require tinymce-jquery
//= require ../teacher/video
//= require ../video
//= require jquery.cookie
//= require cookies
//= require main




$(document).bind('page:change', function() {
  return Holder.run();
});