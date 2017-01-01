class Power < ActiveRecord::Base
  has_many :alien_powers
  has_many :aliens, through: :alien_powers

  def list_of_aliens_with_the_power
    self.aliens.map do |alien|
      alien.name
    end
  end

  def self.count
    self.all.count
  end

  def self.average_num_of_powers
    self.count / Alien.all.length.to_f
  end

  def self.most_common_power
    Power.all.max_by {|power| power.aliens.count}.name
  end








end
