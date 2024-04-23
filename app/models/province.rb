class Province < ApplicationRecord
  has_many :users, foreign_key: 'provinceId'

  validates :provinceName, presence: true, uniqueness: true, length: { is: 2 }
  validates :taxRate, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_associations(auth_object = nil)
    ["users"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "provinceName", "taxRate", "updated_at"]
  end
end
