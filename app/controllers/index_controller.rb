class IndexController < ApplicationController
  layout "index"

  def admin
    if check_admin(current_user.login)
      @users = User.find(:all, :order => "updated_at DESC", :conditions => ["junk is NOT NULL", ])
    else
      render :file=> "public/404.html", :status=>'404 Not Found'
    end
  end

  def top
    @users = User.find(:all, :order => "created_at DESC", :conditions => ["junk is NOT NULL", ])
    @change = false
    @change = true if params.key?(:change)
  end

  def update
    user = params[:user]
    current_user.address = user[:address][0, 256]
    current_user.tel = user[:tel][0, 256]
    current_user.junk = user[:junk][0, 1024]
    current_user.save!
    redirect_to :action => :top
  end

  private
  def check_admin(login_name)
    return ['lie_', 'tetsuomi', 'kaichoo', 'yuiseki', 'itkz', 'itoyanagi', 'hagino3000'].include?(login_name)
  end
end
