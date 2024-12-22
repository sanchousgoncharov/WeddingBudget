class Contractor < ApplicationRecord
  belongs_to :calculation, foreign_key: "calc_id", optional: true

  # Валидации
  validates :name, presence: true
  validates :phone, allow_nil: true, presence: true
  validates :email, allow_nil: true, presence: true
  validates :status, inclusion: { in: [ true, false ] }

  # Установка значений по умолчанию
  after_initialize :set_default_values, if: :new_record?

  private

  def set_default_values
    self.status||= false
  end
end
