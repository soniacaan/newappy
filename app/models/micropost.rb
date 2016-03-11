

class Micropost < ActiveRecord::Base
	belongs_to :user
  belongs_to :micropost_type
  has_many :comments, dependent: :destroy
  has_many :micropost_type
  	default_scope -> { order(created_at: :asc) }
  	mount_uploader :picture, PictureUploader, dependent: :destroy
  	validates :title, length: { maximum: 140 }, presence: true
  	validates :user_id, presence: true
    validates :body, presence: true
    validate :picture_size




 private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 6.megabytes
        errors.add(:picture, "should be less than 6MB")
      end
    end

end
