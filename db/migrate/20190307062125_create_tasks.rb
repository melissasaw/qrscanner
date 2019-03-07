class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	t.string :description
    	t.integer :technician_id
    	t.integer :progress
    	t.references :case

      t.timestamps
    end
  end
end
