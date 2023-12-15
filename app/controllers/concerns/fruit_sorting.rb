module FruitSorting
  extend ActiveSupport::Concern

  DESC = 'desc'
  ASC = 'asc'
  SORT_ORDERS = [
    DESC, ASC
  ]

  def apply_sorting(key)
    case key
    when :fruit
      return @list_items.sort if ascending?

      @list_items.sort.reverse
    when :amount
      @list_items.sort_by do |_, amount|
        ascending? ? amount : -amount
      end
    end.to_h
  end

  private

  def toggle_order
    @order = ascending? ? DESC : ASC
  end

  def ascending?
    return false unless valid_order_param?

    params[:order].casecmp(ASC).zero?
  end

  def valid_order_param?
    params.has_key?(:order) && SORT_ORDERS.include?(params[:order])
  end
end
