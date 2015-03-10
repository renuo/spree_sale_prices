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

end
