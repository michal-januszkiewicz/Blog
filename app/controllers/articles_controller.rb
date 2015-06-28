class ArticlesController < ApplicationController
  before_action :require_admin,   only: [:new, :edit, :create, :update, :destroy]
  before_action :current_article, only: [:edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = 'Article updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy

  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def current_article
      @article = Article.find(params[:id])
    end
end
