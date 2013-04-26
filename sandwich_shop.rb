require "highline/import"

require_relative './item.rb'
require_relative './inventory.rb'
require_relative './sandwich.rb'
require_relative './sandwich_artist.rb'

sandwich_artist = SandwichArtist.new("data/inventory.yaml")

say('Welcome the the Sandwich Shop!')

sandwich_artist.greet
sandwich_artist.take_order

puts "Here is your #{sandwich_artist.sandwich.to_s}"
