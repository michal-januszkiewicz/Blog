class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :require_admin, only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user || current_user.admin?
      redirect_to root_url, alert: "Access denied."
    end
  end

  def destroy
  end
end
