class CommentsController < ApplicationController
  before_action :set_post, only: %i[ new create ]
  before_action :authenticate_user!

  def new
    @comment=@post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    
      respond_to do |format|
        if @comment.save
          format.turbo_stream
           format.html { redirect_to @post }
      end
    end
  end 

  def destroy
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.turbo_stream 
      format.html { redirect_to @post }
        format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id )
  end
  def set_post
    @post = Post.find_by_id(params[:post_id])
  end
  
end
