require_relative '../../lib/restaurant.rb'

describe 'user stories' do

  let(:restaurant) { Restaurant.new }
  let(:menu) { Menu.new }
  let(:order) { Order.new }

  describe "user story 1" do
  # User story 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
    it "prints the menu" do
      expect { restaurant.show_menu }.to output("Starter menu: #{menu.starters}\nMain menu: #{menu.mains}\n").to_stdout
    end
  end

  describe 'user story 2' do
  # User story 2
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
    it "adds to basket" do
      cafe1 = Restaurant.new  
      cafe1.select("rogan josh")
      expect(cafe1.show_basket).to eq(["rogan josh"])
    end

    it "deletes from basket" do
      restaurant.select("rogan josh")
      restaurant.delete("rogan josh")
      expect(restaurant.show_basket).to eq([])
    end

    it "raises error if item not available" do
      expect { restaurant.select("Hubba Bubba") }.to raise_error "Item not added to basket - please select available items"
    end

  end
    # User story 3
    # As a customer

    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order

    # User story 4
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end