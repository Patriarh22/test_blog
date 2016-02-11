class CommentsController < ApplicationController

	before_action :set_post, only: [:create, :edit, :destroy]
	before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    comment = @post.comments.create(comments_params)
    comment.user = current_user
    redirect_to post_path(@post) if comment.save
  end

  def edit
  end

  def update
    @comment.update(comments_params)
    redirect_to post_path(params[:post_id])
  end

  def destroy
  	redirect_to post_path(@post) if @comment.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end