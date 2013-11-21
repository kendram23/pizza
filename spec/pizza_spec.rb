require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'timecop'
require_relative '../pizza'

describe Pizza::Pie do

	before do
		Timecop.freeze(Time.now)
	end

	after do
		Timecop.return
	end
	
	describe '.initialize' do
		it 'records all of the toppings' do
		toppings = [
			Pizza::Topping.new('mushrooms', vegetarian: true),
			Pizza::Topping.new('pepperoni')
		]
		pizza = Pizza::Pie.new(toppings)

		expect(pizza.toppings).to eq(toppings)
		end

		it 'defaults the toppings to cheese only, if the pizza has no toppings' do
		pizza = Pizza::Pie.new

			# Size is an internal method that is available for the toppings array
		expect(pizza.toppings.size).to eq(1)
			# First is used to call on the first object in the array
		expect(pizza.toppings.first.name).to eq('cheese')
		end
	end

	describe '#vegetarian?' do
		it "checks to see if all of the toppings are vegetarian and 	returns true if the pizza is vegetarian" do
			# Cheese is automatically pushed into this array
		veg = Pizza::Pie.new()

		expect(veg.vegetarian?).to eq(true)
		end
	end

	describe '#add_topping' do
		it "Checks to see if a new topping is added to the array" do
		onion = Pizza::Topping.new('onion', vegetarian: true)
		pizza = Pizza::Pie.new()
		pizza.add_topping(['onion'])

		expect(pizza.toppings.size).to eq(2)
		end
	end

	describe '#deliver!' do
		it "Test that a delivery time is marked for 30 minutes from the time it was added" do
		pizza = Pizza::Pie.new()

		expect(pizza.deliver!).to eq(Time.now + 30*60)
		end
	end

	describe '#late?' do
		it "check to see if the delivery is past the delivery time, which is 30 minutes after the order is placed" do
		pizza = Pizza::Pie.new()

		expect(pizza.late?).to eq(true)
		end
	end
end 

describe Pizza::Topping do
	describe '.initialize' do
		it "sets the name of the topping" do
			topping = Pizza::Topping.new('olives')

			expect(topping.name).to eq('olives')

		end
		it 'sets wheather or not the topping is vegetarian' do
			topping = Pizza::Topping.new 'bell peppers', vegetarian: true

			expect(topping.vegetarian).to eq(true)
		end
	end
end