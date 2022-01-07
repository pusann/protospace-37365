class CommentsController < ApplicationController
  def  create
    end
    private
  def  prototype_params
    params.require(:prototype).permit(:text, :created_at, :updete_at).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
  end
end
