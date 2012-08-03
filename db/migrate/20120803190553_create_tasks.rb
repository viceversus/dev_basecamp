class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.datetime :completed_at
      t.integer :list_id

      t.timestamps
    end
  end
end
