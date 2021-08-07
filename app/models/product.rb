class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  belongs_to :user
  has_many :user_products, dependent: :destroy
  # has_many :registered_products, through: :user_products, source: :user
  has_many :product_contacts, dependent: :destroy
  has_many :product_documents, dependent: :destroy
end
