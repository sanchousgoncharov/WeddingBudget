class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :user_email, :password, :password_confirmation)

    @user = User.new(user_params)

    if @user.save
      # cur_user = User.find_by(user_email: user_params[:user_email])&.authenticate(user_params[:password])
      session[:user_id] = @user.id

      redirect_to root_path, notice: "Вы успешно зарегистрировались!"
    else
      flash.now[:alert] = "Вы неправильно заполнили поля регистрации!"

      render :new
    end
  end
end
