class AddPrefectureToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :prefecture, :string
  end
end
