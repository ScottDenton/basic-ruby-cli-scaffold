class CreateNeighbourhoodsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :city_id
    end
  end
end
