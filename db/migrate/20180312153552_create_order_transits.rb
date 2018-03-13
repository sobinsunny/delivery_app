class CreateOrderTransits < ActiveRecord::Migration[5.1]
  def change
    create_table :order_transits do |t|
      t.string :locations
      t.belongs_to :order, foreign_key: true
      t.timestamps
    end
  end
end
