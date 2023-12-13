class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[ create ]

  def create
    begin
      @post = Post.find(params[:post_id])
      @comment =  @post.comments.create(comment_params);
      redirect_to post_path(@post)
    rescue StandardError => exception
      puts "ERROR #{exception}"
    end
   end
    private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
