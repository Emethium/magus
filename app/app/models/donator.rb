class Donator < ApplicationRecord

  validates :name, presence: true
  validates :sex, presence: true
  validates :address, presence: true
  validates :phone, presence: true, length: { maximum: 14 }
  validates :bloodType, presence: true
  validates :rhFactor, presence: true
  validates :age, presence: true
  validates :city, presence: true

  def self.names(name)
    donator = all
    donator = donator.where("name LIKE ?", "%#{name}%")
    return donator
  end

  def self.sexes(sex)
    donator = all
    donator = donator.where("sex IN (?)", sex)
    return donator
  end

  def self.bloodTypes(bloodType)
    donator = all
    donator = donator.where("bloodType IN (?)", bloodType)
    return donator
  end

  def self.rhFactors(rhFactor)
    donator = all
    donator = donator.where("rhFactor IN (?)", rhFactor)
    return donator
  end

  def self.cities(city)
    donator = all
    donator = donator.where("city LIKE ?", "%#{city}%")
    return donator
  end

  def self.apts(apt)
    donator = all
    if apt == "Sim"
      donator = donator.where("lastDonation <= ?", 3.months.ago)
    elsif apt == "Não"
      donator = donator.where("lastDonation > ?", 3.months.ago)
    end
    return donator
  end

end
