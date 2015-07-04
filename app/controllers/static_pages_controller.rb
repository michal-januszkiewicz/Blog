class StaticPagesController < ApplicationController
  def home
  end

  def contact
    @admins = User.where(admin: true)
  end
end
