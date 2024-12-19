class Calculation < ApplicationRecord
  belongs_to :user

  # Связь с другими моделями
  has_many :budgets, foreign_key: "calc_id", dependent: :destroy
  has_many :controls, foreign_key: "calc_id", dependent: :destroy
  has_many :contractors, foreign_key: "calc_id", dependent: :destroy
  has_many :guests, foreign_key: "calc_id", dependent: :destroy
  has_many :alcos, foreign_key: "calc_id", dependent: :destroy

  # Валидации
  validates :title, presence: true
end
