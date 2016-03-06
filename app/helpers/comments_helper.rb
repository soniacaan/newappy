module CommentsHelper
	# author of Comments
  #def hide_edit_delete
  	#if logged_in?	
  		#if 

  #def name_commenter
  #{current_user.name}

  def user_name
  	if logged_in?
  		User.find(current_user.id).name
  	end
  end

  def owner_admin
     @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.find(params[:id])
    @userid = @comment.user_id if logged_in?
    @admin = current_user.admin if logged_in?

    if (current_user.id == @userid || @admin == true)
        @owner_admin = true
    end
  end




end
