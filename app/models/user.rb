class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :province, foreign_key: 'provinceId', optional: true

  validates :name, presence: true
  validates :postalCode, presence: true
  validates :address, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["province"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "encrypted_password", "id", "id_value", "name", "postalCode", "provinceId", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
end
