class Marker < ActiveRecord::Base
  acts_as_mappable
  before_validation :geocode_address, on: [:create, :update]

  def self.produce_array
    results = []
    all_markers = Marker.all
    all_markers.each do |marker|
      location = [
        marker.name, 
        marker.lat, 
        marker.lng, 
        marker.business_type, 
        marker.url, 
        marker.opening_time.strftime("%H %M"), 
        marker.closing_time.strftime("%H %M"),
        marker.rating,
        marker.postcode,
        marker.street_name,
        marker.building_number
      ]
      results.push(location)
    end
    results.to_json
  end

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
