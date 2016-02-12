class Micropost < ActiveRecord::Base
	belongs_to :user
  	default_scope -> { order(created_at: :desc) }
  	validates :title, length: { maximum: 140 }, presence: true
  	validates :user_id, presence: true
    validates :body, presence: true



end
