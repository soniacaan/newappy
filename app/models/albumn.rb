class Albumn < ActiveRecord::Base
	
	has_many :photo_albumns, dependent: :destroy	 
		  





 

end
