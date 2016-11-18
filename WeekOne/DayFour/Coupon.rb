class Coupon
  attr_reader :name,:apply_to,:minimum_items,:discount_items
  def initialize(name,apply_to,minimum_items ,discount_items)
    @name = name
    @apply_to = apply_to
    @minimum_items = minimum_items
    @discount_items = discount_items
  end
end
