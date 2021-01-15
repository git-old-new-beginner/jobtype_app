class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to webtype_path(@comment.webtype)
    else
      @webtype = @comment.webtype
      @comments = @webtype.comments.includes(:user)
      render "webtypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, webtype_id: params[:webtype_id])
  end
end

