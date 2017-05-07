class AddColumnToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :latitude, :integer
    add_column :places, :longitude, :integer
  end
end
