class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)

    if comment.save
      redirect_back_or request.referer + "#comment-content"
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:name,
                                    :email,
                                    :content,
                                    :review_id,
                                    :review_type)
  end
end