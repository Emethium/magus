class SmsModel < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 160 }
end
