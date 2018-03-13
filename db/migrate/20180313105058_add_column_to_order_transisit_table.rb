class AddColumnToOrderTransisitTable < ActiveRecord::Migration[5.1]
  def change
    add_column :order_transits, :agent_name, :string
    add_column :order_transits, :agent_phone_number, :string
  end
end
