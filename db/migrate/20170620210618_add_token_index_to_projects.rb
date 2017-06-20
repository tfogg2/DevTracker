class AddTokenIndexToProjects < ActiveRecord::Migration[5.1]
  def change
    add_index :projects, :share_token
  end
end
