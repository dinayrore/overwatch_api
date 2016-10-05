require 'active_record'
#
class Character < ActiveRecord::Base
  validates :name, :role, presence: true
end

characters = Character.new
puts 'Character was eliminated.' if characters.destroy # => true
