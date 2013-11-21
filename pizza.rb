module Pizza
  class Pie
  	attr_accessor :toppings

  	# On initialization, the default topping is set to cheese if no other toppings are added.

  	def initialize(toppings=[Pizza::Topping.new('cheese', vegetarian: true)])
  		@toppings = toppings
  	end

  	# Adds new toppings to the pizza

  	def add_topping(new_topping)
  		@toppings << new_topping
  	end

  	# Sets the delivery time to 30 minutes from when the pizza is ordered

  	def deliver!(now=nil)
  		@delivery_time = (Time.now + 30*60)
  		return @delivery_time
  	end

  	# Checks to see if the pizza is delivered after the set delivery time

  	def late?
  		Time.now > @delivery_time
  	end

 	# Checks to see if the pizza is vegetarian, by checking the vegetarian boolean from the topping class

  	def vegetarian?
  		if @toppings.any? {|topping| topping.vegetarian != false }
  			return true
  		else
  			return false
  		end
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