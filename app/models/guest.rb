class Guest < ApplicationRecord
  belongs_to :calculation, foreign_key: "calc_id"

  # Валидации
  validates :name, presence: true
  validates :phone, allow_nil: true
  validates :invited, inclusion: { in: [ true, false ] }
  validates :arrive, inclusion: { in: [ true, false ] }
  validates :zags, inclusion: { in: [ true, false ] }
  validates :party, inclusion: { in: [ true, false ] }
end
