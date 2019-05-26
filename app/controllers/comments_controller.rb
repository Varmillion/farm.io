class CommentsController < ApplicationController
  before_action :find_ad
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

  def create
    @comment = @ad.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to ad_path(@ad)
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    redirect_to ad_path(@ad)
  end

  def edit
  
  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to ad_path(@ad)
    else
      render 'edit'
    end
  end

  private

  def find_ad
    @ad = Ad.find(params[:ad_id])
  end

  def find_comment
    @comment =@ad.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "You are not allowed here!"
      redirect_to @ad
    end
  end

end
