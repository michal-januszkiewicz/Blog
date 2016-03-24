class InfosController < ApplicationController
  before_action :require_admin,   only: [:new, :edit, :create, :update, :destroy]
  before_action :current_info,    only: [:edit, :update, :destroy]

  def index
    @infos = Info.all.order('created_at DESC')
  end

  def new
    @info = Info.new
  end

  def edit
    @info = Info.find(params[:id])
  end

  def create
    @info = Info.new(info_params)
    if @info.save
      flash[:success] = t(:info_created)
      redirect_to infos_url
    else
      render "new"
    end
  end

  def update
    if @info.update_attributes(info_params)
      flash[:success] = t(:info_updated)
      redirect_to infos_url
    else
      render "edit"
    end
  end

  def destroy
    @info.destroy
    flash[:success] = t(:info_deleted)
    redirect_to infos_url
  end

  private

    def info_params
      params.require(:info).permit(:title, :text)
    end

    def current_info
      @info = Info.find(params[:id])
    end
end
