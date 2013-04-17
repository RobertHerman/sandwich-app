class Sandwich
    attr_accessor :meat, :bread, :veggies, :condiments
    def description()
        puts "#@meat on #@bread"
        if instance_variable_defined?(:@veggies)
            puts " with #@veggies"
        end
        if instance_variable_defined?(:@condiments)
            puts " and #@condiments"
        end
        return self
    end
end

class SandwichArtist
    @customer_input
    def greet
        customer_input = ""
        until customer_input == "n"
            puts "Can I make you a sandwich? y/n"
            customer_input = gets.chomp
            if customer_input == "y"
                make_sandwich.description
            end
        end
    end
    def make_sandwich
        sandwich = Sandwich.new
        puts "What type of bread?"
        sandwich.bread = gets.chomp
        puts "What type of meat?"
        sandwich.meat = gets.chomp
       
        customer_input = nil
        veggies = ""
        puts "List the veggies (one per line - blank line to end)"
        until customer_input  == ""
            customer_input  = gets.chomp
            if(customer_input != "")
                veggies += "#{customer_input} "
                sandwich.veggies = veggies
            end
        end
        
        customer_input = nil
        condiments = ""
        puts "List the condiments (one per line - blank line to end)"
        until customer_input  == ""
            customer_input = gets.chomp
            if(customer_input != "")
                condiments += "#{customer_input} "
                sandwich.condiments = condiments
            end
        end
        return sandwich
    end
end
bob = SandwichArtist.new
bob.greet
