class RemoveStationFromPlace < ActiveRecord::Migration
  def change
    remove_column :places, :station, :string
  end
end
