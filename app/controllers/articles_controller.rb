class ArticlesController < ApplicationController
  before_action :require_admin,   only: [:new, :edit, :create, :update, :destroy]
  before_action :current_article, only: [:edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article  = Article.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @user = current_user
    @article = @user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article created"
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = "Article updated"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "Article deleted"
    redirect_to articles_url
  end

  private
    def current_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end

end
