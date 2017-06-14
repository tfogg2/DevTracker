class AddTitleToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :steps, :title, :string
    add_column :steps, :time, :integer
    add_column :steps, :completion, :boolean, default: false
  end
end
