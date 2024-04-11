class Province < ApplicationRecord
  has_many :customers

  validates :provinceName, presence: true, uniqueness: true, length: { is: 2 }
end
