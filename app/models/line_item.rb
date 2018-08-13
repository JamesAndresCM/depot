class LineItem < ApplicationRecord
  # referencias (foreign_keys) hacia modelo de Producto y Cart
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart

  def total_price
    product.price * quantity
  end
end
