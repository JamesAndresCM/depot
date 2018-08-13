require 'active_model/serializers/xml'
require 'pago'

class Order < ApplicationRecord
  include ActiveModel::Serializers::Xml
  attr_accessor :credit_card_number, :expiration_date, :routing_number,
                :account_number,
                :po_number
  enum pay_type: {
    "Check" => 0,
    "Credit card"    => 1,
    "Purchase order" => 2
  }
  has_many :line_items, dependent: :destroy
  # ...
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def charge!(pay_type_params)
    payment_details = {}
    payment_method = nil

    case pay_type
    when "Check"
      payment_method = :check
      payment_details[:routing] = pay_type_params[:routing_number]
      payment_details[:account] = pay_type_params[:account_number]
    when "Credit card"
      payment_method = :credit_card
      data = pay_type_params[:expiration_date].to_s.split('/')
      month = data[0]
      year_pay = data[1]
      payment_details[:cc_num] = pay_type_params[:credit_card_number]
      payment_details[:expiration_month] = month
      payment_details[:expiration_year] = year_pay
    when "Purchase order"
      payment_method = :po
      payment_details[:po_num] = pay_type_params[:po_number]
    end

    payment_result = Pago.make_payment(
      order_id: id,
      payment_method: payment_method,
      payment_details: payment_details
    )

    if payment_result.succeeded?
      OrderMailer.shipped(self).deliver_later
    else
      raise payment_result.error
    end
  end
end
