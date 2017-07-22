class Conversation < ActiveRecord::Base
   belongs_to :project, :foreign_key => :project_id
   has_many :messages, dependent: :destroy
   has_many :users, through: :messages
   validates :project_id, uniqueness: true, presence: true 

end
