class CalculationsController < ApplicationController
  def new
    if current_user.nil?
      render plain: "401 Unauthorized: Not authorize", status: :unauthorized
      # redirect_to new_session_path
    else
      @calculation = Calculation.new
      # @calculation.budgets.build
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
      @calculation.touch
      redirect_to calculation_path, notice: "Изменения сохранены!"
    else
      render :edit, alert: "Ошибка обновления расчета."
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
    @budgets = @calculation.budgets.order(:id)
    @controls = @calculation.controls.order(:id)
    @contractors = @calculation.contractors.order(:id)
    @guests = @calculation.guests.order(:id)
    @alcos = @calculation.alcos.order(:id)
  end

private
  def calculation_params
    params.require(:calculation).permit(:title,
    budgets_attributes: [ :id, :title, :planned_sum, :actual_sum, :prepay_sum, :remain_sum, :order, :_destroy ],
    controls_attributes: [ :id, :title, :actual_sum, :prepay_sum, :remain_sum, :date, :place, :order, :_destroy ],
    contractors_attributes: [ :id, :category, :responsible, :description, :status, :name, :phone, :email, :order, :_destroy ],
    guests_attributes: [ :id, :name, :phone, :invited, :arrive, :zags, :party, :guest, :order, :_destroy ],
    alcos_attributes: [ :id, :title, :litres_for_one, :order, :_destroy ])
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
