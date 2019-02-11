class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review

  def self.find_reservation_by_guest(name)
    self.all.find{|reservation| reservation.guest.name == name}
  end

end
