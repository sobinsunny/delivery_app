class AddDefaultValueToDeliveryStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :delivery_status, :integer, default: 0
  end
end
