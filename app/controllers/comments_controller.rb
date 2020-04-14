class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to product_path(@comment.product.id)
    else
      flash[:notice] = "コメント欄が空白です。"
      redirect_to product_path(@comment.product.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
