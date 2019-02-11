class CreateReservationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :checkin
      t.datetime :checkout
      t.integer :listing_id
      t.integer :guest_id
    end
  end
end
