class WebtypesController < ApplicationController
  def index
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
  
  private

  def webtype_params
    params.require(:webtype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
