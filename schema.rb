require_relative 'environment'
require 'active_record'
#
class CreateCharactersTable < ActiveRecord::Migration[5.0]
  def up
    create_table :characters do |c|
      c.string :name
      c.string :role
    end
  end

  def down
    drop_table :characters
  end
end

def main
  action = (ARGV[0] || :up).to_sym

  CreateCharactersTable.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
