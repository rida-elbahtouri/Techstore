class CommentsController < ApplicationController
    before_action :authenticate_user!
   
   

    def create
        id = params[:format].to_i
        comment = current_user.comments.new(comment_params)
        comment.product_id = id
 
        if  comment.save
            flash[:notice] = "your comment has been created succesfully"
            redirect_to product_path(id)
        else
            flash[:alert] = "we couldn't create the comment"
            redirect_to product_path(id)
        end 
    end



    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end