class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :book_id
      t.integer :returned_flag
      t.integer :user_id

      t.timestamps
    end
  end
end
