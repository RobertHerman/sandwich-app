class Sandwich
    attr_accessor :meat, :bread, :veggies, :condiments
    def description()
        puts "#{meat} on #{bread}"
        if instance_variable_defined?(:@veggies)
            puts " with #{veggies}"
        end
        if instance_variable_defined?(:@condiments)
            puts " and #{condiments}"
        end
        return self
    end
end

class SandwichArtist
    def greet
        command = ""
        until command == "n"
            puts "Can I make you a sandwich? y/n"
            command = gets.chop
            if command == "y"
                make_sandwich.description
            end
        end
    end
    def make_sandwich
        sandwich = Sandwich.new
        puts "What type of bread?"
        sandwich.bread = gets.chop
        puts "What type of meat?"
        sandwich.meat = gets.chop
       
        vegatable = nil
        puts "List the veggies (blank line to end)"
        until vegatable  == ""
            vegatable = gets.chop
            if(vegatable != "")
                sandwich.veggies = vegatable
            end
        end
        condiments = nil
        puts "List the condiments (blank line to end)"
        until condiments  == ""
            condiments = gets.chop
            if(condiments != "")
                sandwich.condiments = condiments
            end
        end
        return sandwich
    end
end
bob = SandwichArtist.new
bob.greet

#blt = Sandwich.new
#blt.meat = "turkey"
#blt.bread = "sourdough"
#blt.veggies = "lettuce","onions","tomatoes"
#blt.condiments = "salt","pepper","mustard"
#blt.description
