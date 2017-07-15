class Message < ActiveRecord::Base
   belongs_to :conversation
   belongs_to :user

   validates_presence_of :body



   def message_time

   end
   def notifiable_type
     notifiable_type = "users"
   end
   def action
     action = "messaged"
   end

   after_create_commit do
     NotificationRelayJob.perform_later(self)
   end


end
