module Spree
  # <b>DEPRECATED:</b> Please use <tt>Calculator::FixedAmountSalePriceCalculator</tt> instead.
  class Calculator::DollarAmountSalePriceCalculator < Spree::Calculator
    warn '[DEPRECATION] `DollarAmountSalePriceCalculator` is deprecated.  Please use `FixedAmountSalePriceCalculator` instead. (%s)' % Kernel.caller.first

    def self.description
      "Calculates the sale price for a Variant by returning the provided fixed sale price"
    end

    def compute(sale_price)
      sale_price.value
    end
  end
end
