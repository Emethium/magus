class Message < ApplicationRecord
  attr_accessor :number, :msg
  validates :number,  presence: true, length: { maximum: 14 }
  validates :msg, presence: true, length: { maximum: 255 }
end
