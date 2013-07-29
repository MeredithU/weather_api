class AddZipcodeToCity < ActiveRecord::Migration
  def change
    add_column :cities, :zipcode, :integer
  end
end
