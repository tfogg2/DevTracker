class RemoveUserIdFromConversations < ActiveRecord::Migration[5.1]
  def change
    remove_column :conversations, :user_id
  end
end
