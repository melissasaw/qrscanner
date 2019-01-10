class AddingLoginToUser< ActiveRecord::Migration[5.2]
  def self.up
  	add_column :users, :email, :string
  	add_column :users, :password_digest, :string

  end

  def self.down
  	remove_column :users, :email
  	remove_column :users, :password_digest

  end
end