class AddTypeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :developer_role, :boolean, default: true
    add_column :users, :client_role, :boolean, default: false
  end
end
