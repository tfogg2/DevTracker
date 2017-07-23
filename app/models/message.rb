class Message < ActiveRecord::Base
   belongs_to :conversation
   belongs_to :user
   has_attached_file :image, styles: {thumb: "100x100#"}
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

   validates_presence_of :body



   def message_time

   end
   def notifiable_type
     notifiable_type = "users"
   end

   def recipient_id
     message = self
     conversation_id = self.conversation_id
     @conversation = Conversation.find(conversation_id)
     recipient_id = @conversation.users && @conversation.users.where.not(id: user)
   end

   def action
     action = "messaged"
   end

   after_create_commit do
     NotificationRelayJob.perform_later(self)
   end


end
