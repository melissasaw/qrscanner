class AddingColumnsToUser< ActiveRecord::Migration[5.2]
  def self.up
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :position, :string
  	add_column :users, :employee_id, :integer
  end

  def self.down
  	remove_column :users, :first_name
  	remove_column :users, :last_name
  	remove_column :users, :position
  	remove_column :users, :employee_id
  end
end