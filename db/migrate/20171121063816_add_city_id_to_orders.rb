class AddCityIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :city
  end
end
