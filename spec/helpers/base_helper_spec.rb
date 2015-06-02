require 'spec_helper'

RSpec.describe Spree::BaseHelper, type: :helper do
  describe '#supported_currencies_for_sale_price' do
    context '(chaining backwards compatibility)' do
      it 'can fallback to hardcoded standard currency' do
        expect(helper.supported_currencies_for_sale_price).to eq(['USD'])
      end

      it 'can fallback to config if present' do
        allow(Spree::Config).to receive(:[]).with(:currency).and_return('CHF')
        expect(helper.supported_currencies_for_sale_price).to eq(['CHF'])
      end

      it 'can fallback to current_currency if present (part of newer spree core)' do
        allow(helper).to receive(:current_currency).and_return('CHF')
        expect(helper.supported_currencies_for_sale_price).to eq(['CHF'])
      end

      it 'can use spree_multi_currency if present' do
        allow(helper).to receive(:supported_currencies).and_return(['CHF'])
        expect(helper.supported_currencies_for_sale_price).to eq(['CHF'])
      end
    end
  end
end
