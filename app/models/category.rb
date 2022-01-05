class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :picture, presence: true

  def total
    transactions.sum(:total)
  end
end
