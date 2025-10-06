class Order < ApplicationRecord
  belongs_to :customer
  # enum :status, [:shipped, :being_packaged, :complete, :cancelled]
end
