class CreateExcuses < ActiveRecord::Migration
  def change
    create_table :excuses do |t|
      t.string :cover_story
      t.timestamps
    end
  end
end
