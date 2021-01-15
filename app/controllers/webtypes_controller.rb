class WebtypesController < ApplicationController
  before_action :set_webtype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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
  def set_webtype
    @webtype = Webtype.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @webtype.user
  end
end