require 'spec_helper'

describe Spree::Price do

  it 'can build a new sale by factory' do
    price = build(:price)
    sale_price = price.new_sale(15.99)

    expect(price.on_sale?).to be false
    expect(price.price).to eql BigDecimal.new(19.99, 4)

    expect(sale_price).to have_attributes({
      value: BigDecimal.new(15.99, 4),
      start_at: be_within(1.second).of(Time.now),
      end_at: nil,
      enabled: true,
      calculator: an_instance_of(Spree::Calculator::FixedAmountSalePriceCalculator)
    })
  end

  it 'can put a price (and the attached product) on sale' do
    price = create(:price)
    price.put_on_sale 15.95

    expect(price.on_sale?).to be true
    expect(price.price).to eql BigDecimal.new(15.95, 4)
  end

end
