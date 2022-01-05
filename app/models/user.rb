class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :email, presence: true
  has_many :categories, dependent: :destroy
  has_many :transactions, dependent: :destroy

  def number_of_categories
    categories.count
  end

  def total
    categories.transactions.all.count
  end
end
