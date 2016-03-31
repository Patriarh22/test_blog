# == Schema Information
# Schema version: 20160211154639
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#




class CommentsController < ApplicationController

	before_action :set_post, only: [:create, :edit, :destroy]
	before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

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
