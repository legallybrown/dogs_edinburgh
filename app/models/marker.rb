class Marker < ActiveRecord::Base
  acts_as_mappable
  before_validation :geocode_address, :on => :create, :on => :update

  private

  def geocode_address
    number = self.building_number.to_s || ""
    postcode = self.postcode || ""
    street_name = self.street_name || ""
    address = number + street_name + postcode
    geo = Geokit::Geocoders::MultiGeocoder.geocode (address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat, geo.lng if geo.success
  end



end
