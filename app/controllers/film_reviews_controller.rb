class FilmReviewsController < ApplicationController

  before_action :signed_in_user, expect: [:index, :show]

  def index
    @reviews = FilmReview.all
  end

  def show
    @review = FilmReview.find(params[:id])
  end

  def new
    @review = FilmReview.new
  end

  def create
    @review = FilmReview.new(film_review_params)

    if @review.save
      @review.create_tags(params[:film_review][:tags])
      @review.release_time = Date.parse(params[:film_review][:release_time])
      @review.save
      flash[:success] = "创建成功！"
      redirect_to film_reviews_path
    else
      render :new
    end
  end

  def edit
    @review = FilmReview.find(params[:id])
  end

  def update
    @review = FilmReview.find(params[:id])

    @review.create_tags(params[:film_review][:tags])
    if @review.update_attributes(film_review_params)
      flash[:success] = "更新成功！"
      redirect_to film_reviews_path
    else
      flash[:error] = "更新失败！"
      render :edit
    end
  end

  def destroy
    review = FilmReview.find(params[:id])

    if review.destroy
      flash[:success] = "删除成功！"
    else
      flash[:error] = "删除失败！"
    end

    redirect_to film_reviews_path
  end

  private

  def film_review_params
    params.require(:film_review).permit(:name,
                                        :title,
                                        :image_url,
                                        :level,
                                        :content)
  end
end