class Service < ApplicationRecord
  belongs_to :client
  has_many :invoices, dependent: :destroy
  has_many :billing_items, dependent: :destroy
end
