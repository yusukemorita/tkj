class AddColumnToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :latitude, :number
    add_column :places, :longitude, :number
  end
end
