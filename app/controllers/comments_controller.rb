class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id  # deviseを使用している場合
    if @comment.save
      redirect_to @post, notice: 'コメントを投稿しました。'
    else
      redirect_to @post, alert: 'コメントの投稿に失敗しました。'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
