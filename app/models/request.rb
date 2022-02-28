class Request < ApplicationRecord
  belongs_to :order
  validates :content, presence: true
end
