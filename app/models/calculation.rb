class Calculation < ApplicationRecord
  belongs_to :user

  # Связь с другими моделями
  has_many :budgets, dependent: :destroy
  has_many :controls, dependent: :destroy
  has_many :contractors, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :alcos, dependent: :destroy

  # Валидации
  validates :title, presence: true
end
