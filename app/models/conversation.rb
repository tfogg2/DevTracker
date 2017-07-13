class Conversation < ActiveRecord::Base
   belongs_to :project, :foreign_key => :project_id
   has_many :messages, dependent: :destroy
   has_many :users, through: :messages
   validates_uniqueness_of :project_id

end
