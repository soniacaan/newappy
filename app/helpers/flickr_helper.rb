# app/helpers/flickr_helper.rb
  require 'flickr_fu'

module FlickrHelper  



    def create
      @flickr = Flickr.new(File.join(Rails.root, 'config', 'flickr.yml'))
      redirect_to flickr.auth.url(:write)
    end

    def flickr_callback
      @flickr = Flickr.new
      @flickr.auth.frob = params[:frob]
      current_user.update_attribute :flickr_token, flickr.auth.token.token
    end
   
    def user_photos(user_id, photo_count = 16)
      @flickr = Flickr.new(File.join(Rails.root, 'config', 'flickr.yml'))
      # now you have full access on the user's data :)
      @flickr.photos.search(:user_id => user_id).values_at(0..(photo_count - 1))
    end

    def render_flickr_sidebar_widget(user_id, photo_count = 16, columns = 8)
      begin
      photos = user_photos(user_id, photo_count).in_groups_of(8)
      render :partial => '/flickr/sidebar_widget', :locals => { :photos => photos }
      rescue Exception
      render :partial => '/flickr/unavailable'
      end
    
    end


end