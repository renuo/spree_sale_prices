Deface::Override.new(virtual_path: "spree/orders/_line_item",
                     name: "add_discount_percent_to_cart",
                     replace_contents: ".cart-item-discount",
                     partial: "spree/views/orders/cart_item_discount",
                     disabled: false)

