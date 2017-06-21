class CreateProjectInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :project_invites do |t|
      t.string :share_token
      t.string :email, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
