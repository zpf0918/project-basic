module SessionsHelper

  #登录指定的用户
  def log_in(user)
    session[:user_id] = user.id
  end


  #返回当前登录的用户
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #如果用户已登录，返回true，否则返回false
  def logged_in?
    !current_user.nil?
  end
end
