class Category < ApplicationRecord
    belongs_to :user
    has_many :transactions, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true
end