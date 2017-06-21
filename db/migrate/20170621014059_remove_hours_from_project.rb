class RemoveHoursFromProject < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :hours
  end
end
