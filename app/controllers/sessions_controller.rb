class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token  # API не использует CSRF-токены

  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(user_email: user_params[:user_email])&.authenticate(user_params[:password_digest])

    if user.present?
      session[:user_id] = user.id

      redirect_to calculations_path, notice: "Вы вошли на сайт"
    else
      flash.now[:alert] = "Неправильный email или пароль!"

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: "Вы вышли из аккаунта"
  end
end
