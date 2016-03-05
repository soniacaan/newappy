# app/helpers/flickr_helper.rb
  

module FlickrHelper  
  require 'yaml'
  require 'flickr_fu'
    
    def create
      @flickr = Flickr.new(File.join(Rails.root, 'config', 'flickr.yml'))
      redirect_to flickr.auth.url(:write)
    end

    def flickr_callback
      @flickr = Flickr.new
      @flickr.auth.frob = params[:frob]
      current_user.update_attribute :flickr_token, flickr.auth.token.token
    end
   
    def user_photos(user_id, tags, photo_count = 14)
      @flickr = Flickr.new(File.join(Rails.root, 'config', 'flickr.yml'))
      # now you have full access on the user's data :)
      @flickr.photos.search(:user_id => user_id, :tags => tags).values_at(0..(photo_count - 1))
    end

    

    def render_flickr_sidebar_widget(user_id, tags = 'this', photo_count = 7, columns = 7)
      begin
      photos = user_photos(user_id, tags, photo_count).in_groups_of(7)
      render :partial => '/flickr/sidebar_widget', :locals => { :photos => photos }
      rescue Exception
      render :partial => '/flickr/unavailable'
      end
    
    end

    def render_flickr_sidebar_set(user_id, tags = 'this', photo_count = 14, columns = 7)
      begin
      
      photos = user_photos(user_id, tags, photo_count)
      im_photos = photos.last(7).in_groups_of(7)
     
      

      render :partial => '/flickr/sidebar_set', :locals => { :photos => im_photos }
      rescue Exception
      render :partial => '/flickr/unavailable'
      end
    
    end

    
end