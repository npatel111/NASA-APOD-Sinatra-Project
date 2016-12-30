class CreateAlienPowers < ActiveRecord::Migration[5.0]
  def change
    create_table :alien_powers do |t|
      t.integer :alien_id
      t.integer :power_id
    end
  end
end
