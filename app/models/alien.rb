class Alien < ActiveRecord::Base
  has_many :messages
  belongs_to :location
end
