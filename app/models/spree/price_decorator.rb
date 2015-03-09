Spree::Price.class_eval do
  has_many :sale_prices
  
  def put_on_sale value, params={}
    new_sale(value, params).save
  end

  def new_sale value, params={}
    sale_price_params = {
        value: value,
        start_at: params.fetch(:start_at, Time.now),
        end_at: params.fetch(:end_at, nil),
        enabled: params.fetch(:enabled, true),
        calculator: params.fetch(:calculator_type, Spree::Calculator::DollarAmountSalePriceCalculator.new)
    }
    return sale_prices.new(sale_price_params)
  end
  
  # TODO make update_sale method

  def active_sale
    on_sale? ? first_sale(sale_prices.active) : nil
  end
  alias :current_sale :active_sale

  def next_active_sale
    sale_prices.present? ? first_sale(sale_prices) : nil
  end
  alias :next_current_sale :next_active_sale

  def sale_price
    on_sale? ? active_sale.price : nil
  end
  
  def sale_price=(value)
    on_sale? ? active_sale.update_attribute(:value, value) : put_on_sale(value)
  end

  def discount_percent
    return 0.0 unless original_price > 0
    return 0.0 unless on_sale?
    (1 - (sale_price / original_price)) * 100
  end
  def discount_percent
    on_sale? ? (1 - (sale_price / original_price)) * 100 : 0.0
  end

  def on_sale?
    sale_prices.active.present? && first_sale(sale_prices.active).value != original_price
  end

  def original_price
    self[:amount]
  end
  
  def original_price=(value)
    self[:amount] = Spree::LocalizedNumber.parse(price)
  end
  
  def price
    on_sale? ? sale_price : original_price
  end

  def price=(price)
    if on_sale?
      sale_price = price
    else
      self[:amount] = Spree::LocalizedNumber.parse(price)
    end
  end
  
  def amount
    price
  end

  def enable_sale
    return nil unless next_active_sale.present?
    next_active_sale.enable
  end

  def disable_sale
    return nil unless active_sale.present?
    active_sale.disable
  end

  def start_sale(end_time = nil)
    return nil unless next_active_sale.present?
    next_active_sale.start(end_time)
  end

  def stop_sale
    return nil unless active_sale.present?
    active_sale.stop
  end
  
  private 
  
  def first_sale(scope)
    scope.order("created_at DESC").first
  end
end
