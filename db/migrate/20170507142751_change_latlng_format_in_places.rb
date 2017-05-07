class ChangeLatlngFormatInPlaces < ActiveRecord::Migration
  def up
    change_column :places, :latitude, :decimal, :precision => 25, :scale => 20
    change_column :places, :longitude, :decimal, :precision => 25, :scale => 20
  end

  def down
    change_column :places, :latitude, :integer
    change_column :places, :longitude, :integer
  end
end
