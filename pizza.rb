module Pizza
  class Pie
  	attr_accessor :toppings, :name, :size

  	def initialize(toppings=[cheese = Pizza::Topping.new('cheese')])
  		@name = name
  		@toppings = toppings
  		@size = size
  	end

  end

  class Topping
  	attr_accessor :name, :vegetarian

  	# Instantiate a new topping
  	#
  	# name - The String name of the topping
  	# vegetarian - The Booklean indicating whether or not the topping is vegetarian
  	#
  	# Returns a new Topping object.

  	def initialize(name, vegetarian: false)
  		@name = name
  		@vegetarian = vegetarian
  	end
  end
end