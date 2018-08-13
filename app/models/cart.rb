class Cart < ApplicationRecord
  # un Cart puede tener muchas ordenes (aka line_items)
  has_many :line_items, dependent: :destroy

  # verificar si nuestra lista de artículos ya incluye el producto que estamos agregando;
  # si lo hace, de acorde a la cantidad y, si no lo hace, genera un nuevo LineItem
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
