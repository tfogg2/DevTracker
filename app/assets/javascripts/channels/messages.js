App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden');
    var conversation_id = $("#messages").data('conversation-id');
    if (data.conversation_id == conversation_id){
      return $('#messages').append(this.renderMessage(data));
    }
  },

  renderMessage: function(data) {
    // $.getScript('/messages/message');
    return "<div id='message'><span class='message_name'>" + data.user+ "</span><p class='message_body' data-user-name="+ data.user + "><span class='message_body'>" + data.message + "</span></p></div>";
  }
});
