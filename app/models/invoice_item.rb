class InvoiceItem < ActiveRecord::Base
  validates :item_id, presence: true
  validates :invoice_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true
  belongs_to :invoices
  belongs_to :items

  def self.total_price
    sum(:quantity) * :unit_price
  end

  def self.quantity
    :quantity
  end

  def self.unit_price
    :unit_price
  end 
end
