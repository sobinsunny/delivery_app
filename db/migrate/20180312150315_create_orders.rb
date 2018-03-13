class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :pickup_address
      t.string :delivery_address
      t.integer :delivery_status
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
