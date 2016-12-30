class CreatePowers < ActiveRecord::Migration[5.0]
  def change
    create_table :powers do |t|
      t.string :name
    end
  end
end
