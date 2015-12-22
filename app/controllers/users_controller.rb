class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :require_admin, only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user || current_user.admin?
      flash[:danger] = t(:unauthorized_access)
      redirect_to root_url
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t(:user_deleted)
    redirect_to users_url
  end
end
