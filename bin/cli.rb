# Here's your CLI class! I've included some starter code so you
#   can get a sense on how you might use it! Remember: this
#   class doesn't represent anything in your databse: it's
#   here simply to encapsulate your CLI methods!

# Pro-tip: think about how you might use class and instance
#   variables in a class like this!

class CLI
  def initialize
    puts "Initializing new CLI \n"
    puts
    welcome
  end

  def welcome
    puts "How can I help you today ?"
    puts "You can 'make a reservation' or 'check a reservation'."
    answer = gets.chomp

     answer == 'make a reservation' ? new_user : answer == 'check a reservation' ? check_reservation : goodbye
  end


def new_user
  puts "First we will start with you name ?"
  name = gets.chomp
  puts "and your age ?"
  age = gets.chomp
# creates new user with details provided
  user = User.create(name: name, age: age)
  make_reservation
end


  def make_reservation
    puts "Where would you like to stay ?"
    puts "for a list of options enter 'show listings'"
    title = gets.chomp
    if title == 'show listings'
       Listing.show_all_listings
       puts ""
       make_reservation
     else
        puts "when will you be checking in ?"
        checkin = gets.chomp
        puts "and checking out ?"
        checkout = gets.chomp

        Reservation.create(
          checkin: checkin,
          checkout: checkout,
          listing_id: Listing.find_listing_id(title),
          guest_id: User.last.id
         )

         puts "Thank you for your booking at #{Reservation.last.listing.title}, your total is $#{Reservation.last.listing.price}."
    end
    welcome
  end

  def check_reservation
    puts "What is the name on the reservation, (enter 'name' for a list)"
    name = gets.chomp
    if name == 'name'
       User.show_all_users
       check_reservation
       else
         r = Reservation.find_reservation_by_guest(name)
         puts "Your reservation at #{r.listing.title} on #{r.checkin} is confirmed"
       end
       goodbye
  end

  def goodbye
    puts "Goodbye"
   end

end
