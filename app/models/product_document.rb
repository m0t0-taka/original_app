class ProductDocument < ApplicationRecord
  validates :name, :content, :public_level, presence: true
  belongs_to :user
  belongs_to :product
  mount_uploader :document, DocumentUploader
end
