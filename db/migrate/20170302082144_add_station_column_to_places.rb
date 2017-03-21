class AddStationColumnToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :station, :string
  end
end
