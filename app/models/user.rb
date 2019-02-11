class User < ActiveRecord::Base
  has_many :listings, :foreign_key => 'host_id'
  has_many :reservations, through: :listings
  has_many :reviews, :foreign_key => 'guest_id'


      #Stole the below line from the solution. Just couldnt figure it out
  has_many :trips, class_name: 'Reservation', foreign_key: 'guest_id'


  def self.show_all_users
    self.all.each{|user| puts user.name}
  end

  def self.find_user_by_name(name)
      self.all.find{|user| user.name == name}
  end

end
