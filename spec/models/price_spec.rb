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

  it 'can put a price on a fixed sale' do
    price = create(:price)
    price.put_on_sale 15.95

    expect(price.on_sale?).to be true
    expect(price.price).to eql BigDecimal.new(15.95, 4)
    expect(price.original_price).to eql(19.99)
  end

  it 'can put a price on a percent-off sale' do
    price = create(:price)
    price.put_on_sale 0.2, { calculator_type: Spree::Calculator::PercentOffSalePriceCalculator.new }

    expect(price.on_sale?).to be true
    expect(price.price).to be_within(0.01).of(15.99)
    expect(price.original_price).to eql(19.99)
  end

  context 'calculating discount percentage' do
    it 'returns 0 if there\'s no original price' do
      price = create(:price)
      price.amount = BigDecimal(0)
      expect(price.discount_percent.to_f).to eql 0.0
    end

    it 'returns 0 if it\'s not on sale' do
      price = create(:price)
      expect(price.discount_percent.to_f).to eql 0.0
    end

    it 'returns correct percentage value' do
      price = create(:price)
      price.put_on_sale(15.00)
      expect(price.discount_percent.to_f).to be_within(0.1).of(25)
    end
  end

end
