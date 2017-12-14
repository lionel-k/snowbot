class Order < ApplicationRecord
  belongs_to :user
  belongs_to :domain
  has_one :offer
  monetize :amount_cents
end
