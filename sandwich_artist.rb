require 'yaml'

class SandwichArtist

  attr_reader :sandwich

  def initialize(inventory_file)
    
    @sandwich = Sandwich.new
    @inventory_list = YAML.load_file(inventory_file) 

    #@inventory_list.each { |key, value|
      #puts "\"#{ key }\" : \"#{ value }\""
    #}
  end

  def greet
    puts "Can I make you a sandwich? y/n"
  end

  def take_order
    @inventory_list.each_key do |key|
      if key == 'bread'
        self.generate_menu key, "\nPlease choose a bread."
      else
        begin
          self.generate_menu key, "\nPlease choose the #{key} you would like."
        end while agree "Would you like any more #{key} on your sandwich? (y/n)", true
      end
    end
  end

    protected
    def generate_menu(key, prompt)
      choose do |menu|
        menu.index = :number
        menu.header = "\n:======== #{ key.capitalize } Menu ========"
        menu.prompt = prompt
        menu.hidden "none"
        @inventory_list[key].each { |number,name| menu.choice name do @sandwich.add(key,name) end }
      end
    end
end
