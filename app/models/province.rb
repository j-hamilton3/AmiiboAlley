class Province < ApplicationRecord
  has_many :customers
  has_many :users, foreign_key: 'provinceId'

  validates :provinceName, presence: true, uniqueness: true, length: { is: 2 }
end
