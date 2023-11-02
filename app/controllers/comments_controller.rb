class CommentsController < ApplicationController
  def create
    share = Share.find(params[:share_id])
    comment = share.comments.create(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: { error: 'Failed to create comment' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:comment)
  end
end
