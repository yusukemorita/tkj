class AddSourceToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :source, :string
  end
end
