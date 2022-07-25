class Room < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  after_validation :lat_changed?

  has_many_attached :photos

  has_many :reservations



  private
    # This is used to make sure that our address is actually parsed properly and we
    # get a valuable lat/long
    def lat_changed?
      if (self.address_changed?) # manila  == ashdfkahsdagasd
        if !(self.latitude_changed?) # 120.1723 == number
          errors.add(:address)
          return false
        end
      end
      return true
    end
end