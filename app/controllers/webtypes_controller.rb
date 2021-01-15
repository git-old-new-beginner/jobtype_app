class WebtypesController < ApplicationController
  def index
    @webtype = Webtype.includes(:user)
  end

  def new
    @webtype = Webtype.new
  end

  def create
    @webtype = Webtype.new(webtype_params)
    if @webtype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @webtype = Webtype.find(params[:id])
    @comment = Comment.new
    @comments = @webtype.comments.includes(:user)
  end

  def edit
    @webtype = Webtype.find(params[:id])
  end

  def update
    if @webtype = Webtype.update(webtype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if webtype = Webtype.find(params[:id])
      webtype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def webtype_params
    params.require(:webtype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
