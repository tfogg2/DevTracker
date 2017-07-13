class AddUserProjectToConversations < ActiveRecord::Migration[5.1]
  def change
    remove_column :conversations, :project_id
    remove_column :conversations, :user_id
  end
end
