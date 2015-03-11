require 'spec_helper'

describe Spree::Variant do

  it 'can put a variant on sale' do
    variant = create(:variant)
    expect(variant.on_sale?).to be false

    variant.put_on_sale 10.95

    expect(variant.on_sale?).to be true
    expect(variant.original_price).to eql 19.99
    expect(variant.price).to eql 10.95
  end

  it 'changes the price for all currencies' do
    variant = create(:multi_price_variant)
    variant.put_on_sale 10.95

    expect(variant.prices.count).not_to eql 0
    variant.prices.each do |p|
      expect(p.price).to eql BigDecimal.new(10.95, 4)
    end
  end

  it 'changes the price for specific prices/currencies' do
    variant = create(:multi_price_variant, prices_count: 5)
    some_prices = variant.prices.sample(3)
    variant.put_on_sale 10.95, { currencies: some_prices.map(&:currency) }

    expect(variant.original_price).to eql BigDecimal.new(19.99, 4)

    # some specific prices (by currency) should have changed
    expect(some_prices.count).not_to be 0
    some_prices.each do |p|
      expect(p.price).to eql BigDecimal.new(10.95, 4)
      expect(p.original_price).to eql BigDecimal.new(19.99, 4)
    end
  end

end
