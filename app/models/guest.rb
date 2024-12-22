class Guest < ApplicationRecord
  belongs_to :calculation, foreign_key: "calc_id", optional: true

  # Валидации
  validates :name, presence: true
  validates :phone, allow_nil: true, presence: true
  validates :invited, inclusion: { in: [ true, false ] }
  validates :arrive, inclusion: { in: [ true, false ] }
  validates :zags, inclusion: { in: [ true, false ] }
  validates :party, inclusion: { in: [ true, false ] }

   # Установка значений по умолчанию
   after_initialize :set_default_values, if: :new_record?

   private

   def set_default_values
     self.invited ||= false
     self.arrive ||= false
     self.zags ||= false
     self.party ||= false
   end
end
