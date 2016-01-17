class CommentsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!, only: [:create]
  before_action :current_article,    only: [:create, :update, :destroy]
  before_action :current_comment,    only: [:edit, :update]
  before_action :is_entitled?,       only: [:edit, :update, :destroy]


  def edit
  end

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      flash[:success] = t(:comment_created)
      redirect_to @article
    else
      flash[:error] = t(:something_went_wrong)
      render template: 'articles/show', id: @article.id
    end
  end

  def update
    @comment = @article.comments.find(@comment.id)
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to(@article, notice: t(:comment_updated)) }
        format.json { respond_with_bip(@comment)}
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@comment) }
      end
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = t(:comment_deleted)
    redirect_to @article
  end


  private
    def is_entitled?
      unless is_owner? || current_user.try(:admin)
        flash[:danger] = t(:unauthorized_access)
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
