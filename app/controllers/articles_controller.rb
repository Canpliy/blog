class ArticlesController < ApplicationController

  before_action :signed_in_user, expect: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    @article.create_tags(params[:article][:tags])

    if @article.update_attributes(article_params)
      flash[:success] = "更新成功！"
      redirect_to articles_path
    else
      flash[:error] = "更新失败！"
      render :edit
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      @article.create_tags(params[:article][:tags])
      flash[:success] = "创建成功！"
      redirect_to articles_path
    else
      render :new
    end
  end

  def destroy
    article = Article.find(params[:id])

    if article.destroy
      redirect_to articles_path
    else
      redirect_to root_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end