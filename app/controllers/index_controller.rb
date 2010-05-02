class IndexController < ApplicationController
  layout "index"

  def admin
    if current_user
      if check_admin(current_user.login)
        @users = User.find(:all, :order => "updated_at", :conditions => ["junk is NOT NULL", ])
      else
        redirect_to '/'
      end
    else
      redirect_to '/login'
    end
  end

  def top
    @users = User.find(:all, :order => "created_at DESC", :conditions => ["junk is NOT NULL", ])
    @change = false
    @change = true if params.key?(:change)
  end

  def update
    user = params[:user]
    if check_admin(current_user.login) and user[:id]
      @user = User.find_by_id(user[:id])
      @user.amount = user[:amount]
      @user.delivery = Delivery.find_by_id(user[:delivery_id])
      @user.save!
      redirect_to '/admin'
    else
      current_user.address = user[:address][0, 256]
      current_user.tel = user[:tel][0, 256]
      current_user.junk = user[:junk][0, 1024]
      current_user.save!
      redirect_to '/'
    end
  end

  def admin_json
    if check_admin(current_user.login)
      render :json=> {
        :records => User.find(:all, :order => "updated_at DESC",  :conditions => ["address is NOT NULL", ])
      }
    else
      redirect_to '/login'
    end
  end

  private
  def check_admin(login_name)
    return ['lie_', 'tetsuomi', 'kaichoo', 'yuiseki', 'itkz', 'itoyanagi', 'hagino3000', 'ssig33', 'takano32'].include?(login_name)
  end
  def find_by_way(:name)
  end
end
