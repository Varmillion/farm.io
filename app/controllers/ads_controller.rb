
class AdsController < ApplicationController
  before_action :find_ad, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @ads = Ad.all.order("created_at DESC")
  end 

  def new 
    @ad = current_user.ads.build
  end

  def show
    @comments = Comment.where(ad_id: @ad).order("created_at DESC")
  end

  def create 
    @ad= current_user.ads.build(ad_params)
    if @ad.save
    redirect_to @ad, notice: "Successfully created new Ad"
    else
    render 'new'
    end
  end

  def edit 
  end

  def update 
    if @ad.update(ad_params)
      redirect_to @ad, notice: "Ad was successfully updated!"
    else
      render 'edit'
    end 
  end

  def upvote
    @ad.upvote_by current_user
    redirect_to :back
  end


  def destroy
    @ad.destroy
    redirect_to root_path 
  end
  
  private

  def ad_params
    params.require(:ad).permit(:title, :location, :image, :size, :price)
  end

  def find_ad
    @ad = Ad.find(params[:id])
  end


end
