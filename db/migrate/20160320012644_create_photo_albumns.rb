class CreatePhotoAlbumns < ActiveRecord::Migration
  def change
    create_table :photo_albumns do |t|
    
      	t.timestamps null: false
    end
  end
end
