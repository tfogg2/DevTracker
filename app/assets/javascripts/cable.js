// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  var protocol = window.location.protocol === "https:" ? "wss://" : "ws://";
  var host     = window.AppConfig.WEBSOCKET_HOST || window.location.host;
  var path     = window.AppConfig.WEBSOCKET_PATH || '/cable';
  var userId   = window.AppConfig.WEBSOCKET_USER_ID_SECRET;
  var url      = protocol + host + path;

  if(userId) {
    url += '?user_id=' + encodeURIComponent(userId);
  }

  App.cable = ActionCable.createConsumer();

}).call(this);
