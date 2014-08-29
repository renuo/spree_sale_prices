def discount_percentage(product)
  "#{((1 - product.price.to_f / product.original_price.to_f) * 100).round}%"
end
