class Contractor < ApplicationRecord
  belongs_to :calculation, foreign_key: "calc_id"

  # Валидации
  validates :name, presence: true
  validates :phone, allow_nil: true, presence: true
  validates :email, allow_nil: true, presence: true
  validates :status, inclusion: { in: [ true, false ] }
end
