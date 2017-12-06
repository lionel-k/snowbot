class Order < ApplicationRecord
  belongs_to :user
  belongs_to :domain
  monetize :amount_cents
end
