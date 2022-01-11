class CommentsController < ApplicationController
  def  create
    @comment = Comment.new(comment_params)
     @prototype = @comment.prototype
     @comments = @prototype.comments
    if @comment.save
    redirect_to prototype_path(@comment.prototype.id)
   else
    render "prototypes/show"
    end
    
  end


    private
  def  comment_params
    params.require(:comment).permit(:text, :created_at, :updete_at, :comment).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
  end
end

# 勉強がんばろう！

# 　こんにちは
# 　ありがとう
# 　こんばんわ

# 勉強がんばろう　に紐づく　コメントたち