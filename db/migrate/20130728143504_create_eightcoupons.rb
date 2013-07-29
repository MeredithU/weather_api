class CreateEightcoupons < ActiveRecord::Migration
  def change
    create_table :eightcoupons do |t|
      t.integer :zip
      t.timestamps
    end
  end
end
