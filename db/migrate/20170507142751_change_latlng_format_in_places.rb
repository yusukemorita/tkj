class ChangeLatlngFormatInPlaces < ActiveRecord::Migration
  def up
    change_column :places, :latitude, :decimal
    change_column :places, :longitude, :decimal
  end

  def down
    change_column :places, :latitude, :integer
    change_column :places, :longitude, :integer
  end
end
