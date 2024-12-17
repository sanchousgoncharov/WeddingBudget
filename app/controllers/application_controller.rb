class ApplicationController < ActionController::Base
  helper_method :current_user # метод будет доступен во всех шаблонах
  private # так принято

  # Проверка на авторизацию пользователя. Если пользователь вошел, то вернёт его id, если нет, то nil
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
