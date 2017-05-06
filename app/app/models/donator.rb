class Donator < ApplicationRecord

  validates :name, presence: true
  validates :sex, presence: true
  validates :address, presence: true
  validates :phone, presence: true, length: { maximum: 14 }
  validates :bloodType, presence: true
  validates :rhFactor, presence: true
  validates :age, presence: true
end
