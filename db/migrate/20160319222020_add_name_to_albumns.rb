class AddNameToAlbumns < ActiveRecord::Migration
  def change
    add_column :albumns, :name, :string
  end
end
