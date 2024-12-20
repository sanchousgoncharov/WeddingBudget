class CalculationsController < ApplicationController
  def new
    if current_user.nil?
      render plain: "401 Unauthorized: Not authorize", status: :unauthorized
      # redirect_to new_session_path
    else
      @calculation = Calculation.new
      @calculation.budgets.build
    end
  end

  def create
    @calculation = Calculation.new(calculation_params)
    @calculation.user_id = current_user.id

    if @calculation.save
      redirect_to calculations_path, notice: "Вы создали расчёт!"
    else
      render :new, alert: "Ошибка!"
    end
  end

  def edit
    @calculation = check_user_access
  end


  def update
    @calculation = check_user_access
    if @calculation.update(calculation_params)
      redirect_to calculation_path, notice: "Изменения сохранены!"
    else
      render :show, alert: "Ошибка!"
    end
  end

  def destroy
    @calculation = check_user_access
    @calculation.destroy
    redirect_to calculations_path, notice: "Расчет удален!"
  end

  def index
    if current_user.nil?
      render plain: "401 Unauthorized: Not authorize", status: :unauthorized
    else
      @calculations = current_user.calculations

      if !(@calculations.present?)
        flash.now[:notice] = "У вас ещё нет расчитанных бюджетов для свадьбы! Давайте создадим?)"
      end
    end
  end

  def show
    @calculation = check_user_access
  end

private
  def calculation_params
    params.require(:calculation).permit(:title, budgets_attributes: [ :title, :planned_sum, :actual_sum, :prepay_sum, :remain_sum, :_destroy ])
  end

  def check_user_access
    @calculation = Calculation.find(params[:id])

    if current_user.nil?
      render plain: "401 Unauthorized: Not authorize", status: :unauthorized
    elsif @calculation.nil? || @calculation.user_id != current_user.id
      @calculation = nil
      render plain: "403 Forbidden: You do not have access to this resource", status: :forbidden
    else
      @calculation
    end
  end
end
