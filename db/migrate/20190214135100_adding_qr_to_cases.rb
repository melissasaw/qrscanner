class AddingQrToCases< ActiveRecord::Migration[5.2]
  def self.up
  	add_column :cases, :qr_code, :string

  end

  def self.down
  	remove_column :cases, :qr_code

  end
end