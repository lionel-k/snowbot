class Order < ApplicationRecord
  belongs_to :user
  belongs_to :domain
  belongs_to :offer
  monetize :amount_cents
end
