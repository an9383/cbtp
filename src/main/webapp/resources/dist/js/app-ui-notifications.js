/*!
 * Beagle v1.7.1
 * https://foxythemes.net
 *
 * Copyright (c) 2019 Foxy Themes
 */

var App = (function () {
  'use strict';
  
  App.uiNotifications = function( ){  

    /*Positions*/
    $('#not-tr').click(function(){
      $.extend($.gritter.options, { position: 'top-right' });

      $.gritter.add({
        title: 'Top Right',
        text: 'This is a simple Gritter Notification. Etiam efficitur efficitur nisl eu dictum, nullam non orci elementum',
        class_name: 'clean'
      });

      return false;
    });
    
    $('#not-tl').click(function(){
      $.extend($.gritter.options, { position: 'top-left' });

      $.gritter.add({
        title: 'Top Left',
        text: 'This is a simple Gritter Notification. Etiam efficitur efficitur nisl eu dictum, nullam non orci elementum',
        class_name: 'clean'
      });

      return false;
    });
    
    $('#not-bl').click(function(){

      $.extend($.gritter.options, { position: 'bottom-left' });

      $.gritter.add({
        title: 'Bottom Left',
        text: 'This is a simple Gritter Notification. Etiam efficitur efficitur nisl eu dictum, nullam non orci elementum',
        class_name: 'clean'
      });

      return false;
    });
    
    $('#not-br').click(function(){

      $.extend($.gritter.options, { position: 'bottom-right' });
      
      $.gritter.add({
        title: 'Bottom Right',
        text: 'This is a simple Gritter Notification. Etiam efficitur efficitur nisl eu dictum, nullam non orci elementum',
        class_name: 'clean'
      });

      return false;
    });

    /*Colors*/
    $('#not-primary').click(function(){
      $.gritter.add({
        title: 'Primary',
        text: 'This is a simple Gritter Notification.',
        class_name: 'color primary'
      });
    });
    
    $('#not-success').click(function(){
      $.gritter.add({
        title: 'Success',
        text: 'This is a simple Gritter Notification.',
        class_name: 'color success'
      });
    });
    
    $('#not-warning').click(function(){
      $.gritter.add({
        title: 'Warning',
        text: 'This is a simple Gritter Notification.',
        class_name: 'color warning'
      });
    });
    
    $('#not-danger').click(function(){
      $.gritter.add({
        title: 'Danger',
        text: 'This is a simple Gritter Notification.',
        class_name: 'color danger'
      });
    });

    /*Alt Colors*/
    
    $('#not-dark').click(function(){
      $.gritter.add({
        title: 'Dark Color',
        text: 'This is a simple Gritter Notification.',
        class_name: 'color dark'
      });
    });

  };

  return App;
})(App || {});
