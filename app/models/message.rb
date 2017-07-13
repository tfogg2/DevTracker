class Message < ActiveRecord::Base
   belongs_to :conversation
   belongs_to :user

   validates_presence_of :body


   def message_time

   end
end
