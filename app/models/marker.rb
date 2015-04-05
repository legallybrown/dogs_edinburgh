class Marker < ActiveRecord::Base
  
  before_save :time_format

  def time_format
    self.opening_time.strftime('%H:%M') unless self.opening_time.blank?
    self.closing_time.strftime('%H:%M') unless self.closing_time.blank?
  end 
end
