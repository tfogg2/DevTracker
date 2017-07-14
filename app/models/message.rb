class Message < ActiveRecord::Base
   belongs_to :conversation
   belongs_to :user

   validates_presence_of :body



   def message_time

   end

   after_create_commit do
     NotificationRelayJob.perform_later(self)
   end


end
