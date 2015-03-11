require 'spec_helper'

describe Spree::Variant do

  it 'can put a variant on a standard sale' do
    variant = create(:variant)
    expect(variant.on_sale?).to be false

    variant.put_on_sale 10.95

    expect(variant.on_sale?).to be true
    expect(variant.original_price).to eql 19.99
    expect(variant.price).to eql 10.95
  end

  it 'changes the price of all attached prices' do
    variant = create(:multi_price_variant)
    variant.put_on_sale 10.95

    expect(variant.prices.count).not_to eql 0
    variant.prices.each do |p|
      expect(p.price).to eql BigDecimal.new(10.95, 4)
    end
  end

  it 'changes the price for each specific currency' do
    variant = create(:multi_price_variant, prices_count: 5)

    variant.prices.each do |p|
      variant.put_on_sale 10.95, { currencies: [ p.currency ] }

      expect(variant.price_in(p.currency).price).to eq BigDecimal.new(10.95, 4)
      expect(variant.original_price_in(p.currency).price).to eql BigDecimal.new(19.99, 4)
    end
  end

  it 'changes the price for multiple currencies' do
    variant = create(:multi_price_variant, prices_count: 5)
    some_prices = variant.prices.sample(3)

    variant.put_on_sale(10.95, {
      currencies: some_prices.map(&:currency)
      # TODO: does not work yet, because sale_prices take the calculator instance away from each other
      #calculator_type: Spree::Calculator::PercentOffSalePriceCalculator.new
    })

    some_prices.each do |p|
      expect(variant.price_in(p.currency).price).to be_within(0.01).of(10.95)
      expect(variant.original_price_in(p.currency).price).to eql BigDecimal.new(19.99, 4)
    end
  end

end
