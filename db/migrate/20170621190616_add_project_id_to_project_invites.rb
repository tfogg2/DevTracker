class AddProjectIdToProjectInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :project_invites, :project_id, :integer
  end
end
