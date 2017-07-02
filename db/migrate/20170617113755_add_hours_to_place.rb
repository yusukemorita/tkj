class AddHoursToPlace < ActiveRecord::Migration
  def change
    add_column :places, :hours, :text
  end
end
