module FruitSorting
  extend ActiveSupport::Concern

  def apply_sorting(key)
    @list_items = case key
                  when :amount
                    @list_items.sort_by { |_, amount| -amount }
                  end.to_h
  end
end
