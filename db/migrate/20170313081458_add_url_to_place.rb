class AddUrlToPlace < ActiveRecord::Migration
  def change
    add_column :places, :url, :string
  end
end
