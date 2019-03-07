class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
    	t.string :serial_number
    	t.integer :case_type
    	t.references :user
    
      t.timestamps
    end
  end
end
