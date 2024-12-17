class Alco < ApplicationRecord
  belongs_to :calculation, foreign_key: "calc_id"

  # Валидации
  validates :title, presence: true
  validates :litres_for_one, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
