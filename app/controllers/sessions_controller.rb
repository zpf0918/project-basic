class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to current_user
    else
      flash.now[:warning] ="密码不正确"
      render 'new'
    end
  end

  def destroy

  end
end
