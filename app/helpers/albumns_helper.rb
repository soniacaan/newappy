module AlbumnsHelper

	def render_albumn(name)
      begin
      @albumn = Albumn.find_by(name: name)
      render :partial => '/albumns/sidebar_widget', :locals => { :albumn => albumn }
      rescue Exception
      render :partial => '/flickr/unavailable'
      end
    
  end
end
