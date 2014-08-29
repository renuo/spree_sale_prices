def discount_percentage(product)
  if product.master.msrp.present?
    "#{((1 - product.price.to_f / product.master.msrp.to_f) * 100).round}%"
  end
end
