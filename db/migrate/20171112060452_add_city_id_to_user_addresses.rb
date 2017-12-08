class AddCityIdToUserAddresses < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_addresses, :city
  end
end
