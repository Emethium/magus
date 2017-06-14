class Donation < ApplicationRecord

  validates :collectionDate, presence: true
  validates :donator_id, presence: true
end
