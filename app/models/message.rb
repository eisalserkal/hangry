class Message < ApplicationRecord
  belongs_to :cable
  belongs_to :cover
end
