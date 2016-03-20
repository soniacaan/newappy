class AddAlbumRefToPhotoAlbumn < ActiveRecord::Migration
  def change
    add_reference :photo_albumns, :albumn, index: true
    add_foreign_key :photo_albumns, :albumns
  end
end
