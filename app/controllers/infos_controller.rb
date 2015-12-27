class InfosController < ApplicationController
  def index
    @infos = Info.all.order('created_at DESC')
  end

  def new
    @info = Info.new
  end
end
