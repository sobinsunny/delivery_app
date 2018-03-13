class RenameColumnLocationsToLocation < ActiveRecord::Migration[5.1]
  def change
    rename_column :order_transits, :locations, :location
  end
end
