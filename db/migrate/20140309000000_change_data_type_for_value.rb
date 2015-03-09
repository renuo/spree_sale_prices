class ChangeDataTypeForValue < ActiveRecord::Migration
  def change
    change_column :spree_sale_prices, :value, :decimal, precision: 10, scale: 2, null: false
  end
end
