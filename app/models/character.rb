class Character < ApplicationRecord
  has_many :amiibos

  validates :name, presence: true, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["amiibos"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
