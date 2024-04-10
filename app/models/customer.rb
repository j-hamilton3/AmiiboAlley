class Customer < ApplicationRecord
  belongs_to :provinces
  has_many :orders

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
