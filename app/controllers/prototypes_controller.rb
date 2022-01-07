class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def  index #トップページ
    @prototypes = Prototype.all
  end

  def  new #投稿の入力ページ
    @prototype = Prototype.new
  end
      
  def  create #投稿ページに入れたデータを保存する
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to  root_path
    else
      render :new
    end
  end
    def  edit
      @prototype = Prototype.find(params[ :id])
    end
     

  def  show
    @prototype = Prototype.find(params[ :id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  private
  def  prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end
  def updete
    @prototype = Prototype.new(prototype_params)
    if @prototype.updete
      redirect_to  root_path
    else
      render :new
    end
  end

  def  destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    end

    unless user_signed_in?
      redirect_to action: :edit
    end
end  