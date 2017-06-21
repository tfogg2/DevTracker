class RemoveColumnsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :developer_role, :boolean, default: true
    remove_column :users, :client_role, :boolean, default: false

    remove_column :projects, :share_token
    remove_column :projects, :client
  end
end
