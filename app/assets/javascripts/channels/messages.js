App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden');
    $('.create_messages').addClass('hidden');

    var conversation_id = $("#messages").data('conversation-id');
    if (data.conversation_id == conversation_id){
       $('#messages').append(this.renderMessage(data));
      //  return
    }
    var height = $('#conversation')[0].scrollHeight;
    $("#conversation").scrollTop(height);

  },

  renderMessage: function(data) {
    var user_name = $("#messages").data('user-name');
    if (data.user == user_name){
      return "<div id='message' class='current_user'><span class='message_name'>" + data.user+ "</span><p data-user-name="+ data.user + "><span class='message_body'>" + data.message + "</span></p></div>";
    } else {
      return "<div id='message'><span class='message_name'>" + data.user+ "</span><p data-user-name="+ data.user + "><span class='message_body'>" + data.message + "</span></p></div>";
    };
  }
});
