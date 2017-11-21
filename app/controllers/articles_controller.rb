class ArticlesController < ApplicationController
  before_action :load_article, only: [:show, :update, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to articles_path
  end

  def update
    @article.update_attributes(article_params)
    redirect_to articles_path
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

private

  def load_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
