class Budget < ApplicationRecord
  belongs_to :calculation, foreign_key: "calc_id"

  # Валидации
  validates :title, presence: true
  validates :planned_sum, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :actual_sum, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :prepay_sum, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :remain_sum, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
