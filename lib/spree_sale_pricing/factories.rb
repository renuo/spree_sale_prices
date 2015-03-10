FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_sale_pricing/factories'

  factory :sale_price, class: Spree::SalePrice do
    value { BigDecimal.new(15.99, 4) }
    start_at { Time.now }
    end_at nil
    enabled true
    calculator { Spree::Calculator::FixedAmountSalePriceCalculator.new }
  end

end
