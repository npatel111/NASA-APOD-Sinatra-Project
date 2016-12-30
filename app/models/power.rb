class Power < ActiveRecord::Base
  has_many :alien_powers
  has_many :aliens, through: :alien_powers
end
