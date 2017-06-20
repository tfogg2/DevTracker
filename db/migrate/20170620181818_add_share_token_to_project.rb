class AddShareTokenToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :share_token, :string
  end
end
