class AddUserTypeToUserProject < ActiveRecord::Migration[5.1]
  def change
    add_column :user_projects, :user_type, :string
  end
end
