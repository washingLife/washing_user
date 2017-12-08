class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.references :user_address, foreign_key: true
      t.float :total_price
      t.string :courier_status
      t.integer :voucher_status

      t.timestamps
    end
  end
end