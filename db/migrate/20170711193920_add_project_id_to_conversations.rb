class AddProjectIdToConversations < ActiveRecord::Migration[5.1]
  def change
    remove_column :conversations, :user_project_id
    add_column :conversations, :project_id, :integer, unique: true
    add_column :conversations, :user_id, :integer
  end
end
