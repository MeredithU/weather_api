class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :startzip
      t.integer :endzip
      t.string  :response
      t.timestamps
    end
  end
end
