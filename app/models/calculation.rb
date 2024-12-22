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

  accepts_nested_attributes_for :budgets, allow_destroy: true
  accepts_nested_attributes_for :controls, allow_destroy: true
  accepts_nested_attributes_for :contractors, allow_destroy: true
  accepts_nested_attributes_for :alcos, allow_destroy: true
  accepts_nested_attributes_for :guests, allow_destroy: true
end
