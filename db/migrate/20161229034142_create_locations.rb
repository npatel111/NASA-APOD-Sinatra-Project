class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :date_traveled
      t.string :explanation
      t.string :title
      t.string :url
    end
  end
end
