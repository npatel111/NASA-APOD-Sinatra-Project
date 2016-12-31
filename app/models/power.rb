class Power < ActiveRecord::Base
  has_many :alien_powers
  has_many :aliens, through: :alien_powers

  def list_of_aliens_with_the_power
    self.aliens.map do |alien|
      alien.name
    end
  end



end
