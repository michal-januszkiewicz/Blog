class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :current_article,    only: [:create, :update, :destroy]
  before_action :current_comment,    only: [:edit, :update]
  before_action :is_entitled?,       only: [:edit, :update, :destroy]


  def edit
  end

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to @article
    else
      render 'articles/show', @article.id
      # render "new"
    end
  end

  def update
    if @article.comments.find(@comment.id).update_attributes(comment_params)
      flash[:success] = "Comment updated"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to @article
  end


  private
    def is_entitled?
      unless is_owner? || current_user.try(:admin)
        flash[:danger] = "Sorry mate, you can't do this"
        redirect_to current_article
      end
    end

    def is_owner?
      current_comment.user_id == current_user.try(:id)
    end

    def current_comment
      @comment = Comment.find(params[:id])
    end

    def current_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end

    def comment_edit_params
      params.require(:comment).permit(:content)
    end
end
