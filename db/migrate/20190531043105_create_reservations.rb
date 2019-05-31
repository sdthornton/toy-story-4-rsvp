class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :name
      t.integer :tickets
    end
  end
end
