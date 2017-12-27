class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user #注册后直接登录
      flash[:notice] = "注册成功"
      redirect_to @user
    else
      render :new
    end
  end


  private

   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end
