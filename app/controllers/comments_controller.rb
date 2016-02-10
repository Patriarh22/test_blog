class CommentsController < ApplicationController

	before_action :set_post, only: [:create, :edit, :destroy]
	before_action :set_comment, only: [:update, :destroy]

  def create
    redirect_to post_path(@post) if @post.comments.create(comments_params)
  end

  def edit
  end

  def update
    @comment.update(comments_params)
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
