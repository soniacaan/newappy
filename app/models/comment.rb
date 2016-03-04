class Comment < ActiveRecord::Base
  belongs_to :micropost
  		  	validates :user_id, presence: true
  		  	default_scope -> { order(created_at: :desc) }
  		  	validates :body, presence: true
  		  	validates :micropost_id, presence: true



end
