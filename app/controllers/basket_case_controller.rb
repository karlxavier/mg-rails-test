class BasketCaseController < ApplicationController
  include FruitSorting

  before_action :set_fruits
  before_action :set_items

  def index
    render_sorted_fruits(:fruit)
  end

  def order_by_fruit
    render_sorted_fruits(:fruit)
  end

  def order_by_amount
    render_sorted_fruits(:amount)
  end

  private
    def set_fruits
      @fruits = {
        oranges: 5,
        apples: 9,
        grapes: 3,
        watermelons: 2
      }
    end

    def set_items
      @list_items = @fruits
    end

    def render_sorted_fruits(key)
      @list_items = apply_sorting(key)

      render(
        'basket_case/index',
        locals: {
          list_items: @list_items,
          order: toggle_order
        }
      )
    end
end
