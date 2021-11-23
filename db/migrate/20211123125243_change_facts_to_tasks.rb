class ChangeFactsToTasks < ActiveRecord::Migration[6.1]
  def change
    rename_column :facts, :fact, :task
  end
end
