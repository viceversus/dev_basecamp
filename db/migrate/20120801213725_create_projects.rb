class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.boolean :public
      t.integer :owner_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
