class Users < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cel, :string , unique: true
    add_index :users, :cel, unique: true
  end
end
