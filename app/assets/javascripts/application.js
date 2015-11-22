// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
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
//= require turbolinks
//= require confirmation_new.js
//= require_tree .

//$(document).ready(function () {
 
//alert("document ready");
 
//});

function validate()
      {
         var textarea = document.getElementById('bankaccount_comments');
      
         if(textarea.value == "" )
        {
            alert("Veuillez fournir la raison du rejet de la circularisation");
            return false;
        } else {
            return true;}
}
