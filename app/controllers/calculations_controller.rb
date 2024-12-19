class CalculationsController < ApplicationController
  def new
    @calculation = Calculation.new
  end

  def create
    @calculation = Calculation.new(calculation_params)
    @calculation.user_id = current_user.id

    if @calculation.save
      redirect_to root_path, notice: "Вы создали расчёт!"
    else
      render :new, alert: "Ошибка!"
    end
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end

private
  def calculation_params
    params.require(:calculation).permit(:title)
  end
end
