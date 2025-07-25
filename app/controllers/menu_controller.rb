class MenuController < ApplicationController
  def index
    @menu = {
      "Burgers" => [
        { id: "cheeseburger", name: "Cheeseburger", description: "Classic cheeseburger with lettuce and tomato", price: 3.99 },
        { id: "double_double", name: "Double-Double", description: "Double meat, double cheese", price: 5.49 },
        { id: "hamburger", name: "Hamburger", description: "Grilled hamburger with fresh ingredients", price: 3.49 }
      ],
      "Fries" => [
        { id: "fries", name: "Regular Fries", description: "Golden and crispy", price: 2.49 },
        { id: "animal_style", name: "Animal Style Fries", description: "Fries with cheese, grilled onions & spread", price: 3.49 }
      ],
      "Drinks" => [
        { id: "soda", name: "Soda", description: "Refreshing soda of your choice", price: 1.99 },
        { id: "shake", name: "Shake", description: "Vanilla, chocolate, or strawberry shake", price: 2.99 }
      ]
    }
  end

  def order
    menu_items = {
      "cheeseburger" => { name: "Cheeseburger", price: 3.99 },
      "double_double" => { name: "Double-Double", price: 5.49 },
      "hamburger" => { name: "Hamburger", price: 3.49 },
      "fries" => { name: "Regular Fries", price: 2.49 },
      "animal_style" => { name: "Animal Style Fries", price: 3.49 },
      "soda" => { name: "Soda", price: 1.99 },
      "shake" => { name: "Shake", price: 2.99 }
    }

    order = []
    total = 0.0

    params.each do |key, value|
      if menu_items[key] && value.to_i > 0
        quantity = value.to_i
        price = menu_items[key][:price]
        item_total = quantity * price
        total += item_total
        order << {
          name: menu_items[key][:name],
          quantity: quantity,
          price: price,
          total: item_total
        }
      end
    end

    session[:order] = order
    session[:total] = total
    redirect_to action: :index, anchor: "summary"
  end
end