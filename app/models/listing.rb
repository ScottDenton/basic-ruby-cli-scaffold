class Listing < ActiveRecord::Base
  belongs_to :host, :class_name => "User"
  belongs_to :neighborhood
  has_many :reservations
  has_many :guests, through: :reservations, :class_name=> 'User'
  has_many :reviews, through: :reservations

  def self.show_all_listings
    self.all.each{|listing| puts listing.title}
  end

  def self.find_listing_id(listing_title)
    self.all.find{|listing| listing.title == listing_title}.id
  end
end
