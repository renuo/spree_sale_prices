require 'spec_helper'

describe Spree::Product do

  it 'can put a product on sale' do
    product = create(:product)
    expect(product.price).to eql 19.99
    expect(product.original_price).to eql 19.99
    expect(product.on_sale?).to be false

    product.put_on_sale 10.95

    expect(product.price).to eql 10.95
    expect(product.original_price).to eql 19.99
    expect(product.on_sale?).to be true
  end

end
