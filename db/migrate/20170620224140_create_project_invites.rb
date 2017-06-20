class CreateProjectInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :project_invites do |t|
      t.string :share_token, foreign_key: true
      t.string :email,              null: false, default: ""
      t.timestamps
    end
  end
end
