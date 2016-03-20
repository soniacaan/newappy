class CreateAlbumns < ActiveRecord::Migration
  def change
    create_table :albumns do |t|
    
      t.timestamps null: false
    end
  end
end
