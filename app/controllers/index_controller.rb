class IndexController < ApplicationController
  def show
    @user = User.find_by_login(params["login"])
    render :file=> "public/404.html", :status=>'404 Not Found' and return unless @user
  end

  def users
    @users = User.find(:all, :order => "updated_at DESC")
  end


end
