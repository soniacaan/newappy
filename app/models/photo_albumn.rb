class PhotoAlbumn < ActiveRecord::Base
	
	mount_uploader :photo_albumn, PictureUploader, dependent: :destroy
	belongs_to :albumn
	validate :picture_size



	private

    # Validates the size of an uploaded picture.
    def picture_size
      if photo_albumn.size > 6.megabytes
        errors.add(:photo_albumn, "should be less than 6MB")
      end
    end

    
end
