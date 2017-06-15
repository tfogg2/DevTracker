class ChangeTimeToHours < ActiveRecord::Migration[5.1]
  def change
    rename_column :projects, :time, :hours
    rename_column :steps, :time, :hours
    remove_column :steps, :completion
    add_column :steps, :status, :string
  end
end
