class Transaction < ApplicationRecord
  belongs_to :category

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
