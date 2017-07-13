class AddUserProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :user_project_id, :integer, unique: true
  end
end
