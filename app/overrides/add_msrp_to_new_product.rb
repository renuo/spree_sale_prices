Deface::Override.new(virtual_path: "spree/admin/products/new",
                     name: "add_msrp_to_new_product",
                     replace_contents: "[data-hook='new_product_attrs']",
                     partial: "spree/admin/products/new_product_attrs",
                     disabled: false)
