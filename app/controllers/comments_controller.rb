class CommentsController < ApplicationController
    
    before_filter :create_comment, only: [:create]
   




def create
   @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id if logged_in?
    @comment.save
    

   
    unless @comment.save 
        redirect_to  micropost_path(@micropost, :anchor => "commentAdd"), notice: "Please Sign-in to add your comment." 
    else
          redirect_to micropost_path(@micropost, :anchor => "commentAdd")
    end

end

def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.find(params[:id])
    @userid = @comment.user_id
    @admin = current_user.admin if logged_in?
     
    if (logged_in? && (current_user.id == @userid || @admin == true))
        @comment.destroy
        redirect_to micropost_path(@micropost, :anchor => "comment")
    else
      redirect_to micropost_path(@micropost, :anchor => "comment"), notice: "Only owner can delete." 
  end

end
 

def create_comment
    logged_in?

      
  end
 
  private

   
    def comment_params
      params.require(:comment).permit(:body, :micropost_id)
    end

    
    

   


end



