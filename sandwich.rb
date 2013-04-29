require "progressbar"

class Sandwich

	attr_reader :contents

	def initialize
		@contents = {}
	end
	
	def add(type,name)
		@contents[type] = [] unless @contents.has_key? type
		@contents[type] << name unless @contents[type].include? name
		self
	end

	def to_s
		return 'No Sandwich made yet.' if @contents.empty?

    progress_bar = ProgressBar.new("Your Sandwich",100)
    100.times {sleep(0.1); progress_bar.inc}; progress_bar.finish

		bread 	  	= @contents['bread']
		meats		    = @contents['meat']
		vegtables 	= @contents['vegtables']
		condiments	= @contents['condiments']
		sandwich_description = String.new ''

		#list meat first
    sandwich_description = layout_ingredients(meats, sandwich_description )
    sandwich_description = sandwich_description  + ' ' + layout_ingredients(bread, 'on')
    sandwich_description = sandwich_description  + ' ' + layout_ingredients(vegtables, 'with')
    sandwich_description = sandwich_description  + ' ' + layout_ingredients(condiments, 'topped with')
    sandwich_description += '.'
	end

	private

		def layout_ingredients(ingredient, prefix=nil, glue = ',')
			list = prefix if !prefix.nil?
			ingredient.each do |name|
				if list.empty? 
					list = name
				else
					list = "#{list} #{name}"
				end
				list = "#{list}#{glue}" unless ingredient.last == name 
			end
			list
		end
end
