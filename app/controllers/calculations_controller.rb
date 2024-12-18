class CalculationsController < ApplicationController
  def new
    @calculation = Calculation.new
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
    @calculations = current_user.calculations

    if !(@calculations.present?)
      flash.now[:notice] = "У вас ещё нет расчитанных бюджетов для свадьбы! Давайте создадим?)"
    end
  end

  def show
    @calculation = check_user_access
  end

private
  def calculation_params
    params.require(:calculation).permit(:title)
  end

  def check_user_access
    @calculation = Calculation.find(params[:id])

    if @calculation.nil? || @calculation.user_id != current_user.id
      @calculation = nil
      render plain: "403 Forbidden: You do not have access to this resource", status: :forbidden
    else
      @calculation
    end
  end
end
