FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_sale_pricing/factories'

  factory :sale_price, class: Spree::SalePrice do
    value { BigDecimal.new(rand(10..1000), 6) }
    start_at { Time.now }
    end_at nil
    enabled true
    calculator { Spree::Calculator::FixedAmountSalePriceCalculator.new }
  end

  factory :international_price, parent: :price do
    amount { BigDecimal.new(rand(10..1000), 6) }
    currency { Faker::Currency.code }
  end

  factory :multi_price_variant, parent: :variant do
    transient do
      prices_count 3
    end

    after(:create) do |variant, evaluator|
      create_list(:international_price, evaluator.prices_count, variant: variant)
    end
  end

end
