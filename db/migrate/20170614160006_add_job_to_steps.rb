class AddJobToSteps < ActiveRecord::Migration[5.1]
  def change
    add_reference :steps, :job, foreign_key: true
  end
end
