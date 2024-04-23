class Province < ApplicationRecord
  has_many :customers
  has_many :users, foreign_key: 'provinceId'

  validates :provinceName, presence: true, uniqueness: true, length: { is: 2 }
  validates :taxRate, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
