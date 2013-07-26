class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :country
      t.integer :zip

      t.timestamps
    end
  end
end
