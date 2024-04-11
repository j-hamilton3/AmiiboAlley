class Customer < ApplicationRecord
  belongs_to :provinces
  has_many :orders

  validates :fullName, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :city, presence: true
  validates :postalCode, presence: true, length: {maximum: 7}
  validates :provinceId, presence: true, numericality: true
end
