class RemoveDistrictFromPlace < ActiveRecord::Migration
  def change
    remove_column :places, :district, :string
  end
end
