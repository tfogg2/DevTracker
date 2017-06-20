class CreateUserProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :user_projects do |t|
      t.integer :user_id, foreign_key: true
      t.integer :project_id, foreign_key: true

      t.timestamps
    end
  end
end
