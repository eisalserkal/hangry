class Order < ApplicationRecord
  belongs_to :receipt
  belongs_to :cover
end
