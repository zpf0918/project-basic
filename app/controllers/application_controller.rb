class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  #确保已登录
  def logged_in_user
    unless logged_in?
      store_location
      flash[:warning] = "请先登录"
      redirect_to login_url
    end
  end


  #确保是正确的用户
  def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
   end

end
