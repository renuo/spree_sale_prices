require 'spec_helper'

describe Spree::SalePrice do

  it 'can start and end never' do
    sale_price = build(:sale_price)
    sale_price.start

    expect(sale_price).to be_enabled
    expect(sale_price.end_at).to be(nil)
  end

  it 'can start and then end at a specific time' do
    sale_price = build(:sale_price)
    sale_price.start(1.day.from_now)

    expect(sale_price).to be_enabled
    expect(sale_price.end_at).to be_within(1.second).of(1.day.from_now)
  end

  it 'can stop' do
    sale_price = build(:active_sale_price)
    sale_price.stop

    expect(sale_price).not_to be_enabled
    expect(sale_price.end_at).to be_within(1.second).of(Time.now)
  end

  it 'can create a money price ready to display' do
    sale_price = build(:active_sale_price)
    money = sale_price.display_price

    expect(money).to be_a Spree::Money
    expect(money.money.currency).to eq(sale_price.currency)
    expect(money.money.amount).to eq(sale_price.calculated_price)
  end

end
