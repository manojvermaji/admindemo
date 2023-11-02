class LikesController < ApplicationController
  def create
    @share = Share.find(params[:share_id])
    @user = User.find(params[:user_id])
    if @share.likes.where(user: @user).exists?
      render json: { error: 'You have already liked this share' }, status: :unprocessable_entity
    else
      like = @share.likes.create(user: @user)
      like.like  
      likes_count = @share.likes_count
      render json: { likes_count: likes_count }, status: :created
    end
  end


  def destroy
    @share = Share.find(params[:share_id])
    @user = User.find(params[:user_id])
    like = @share.likes.find_by(user: @user)

    if like
      like.destroy
      like.unlike  
      likes_count = @share.likes_count
      render json: { likes_count: likes_count }
    else
      render json: { error: 'You have not liked this share' }, status: :unprocessable_entity
    end
  end
end
