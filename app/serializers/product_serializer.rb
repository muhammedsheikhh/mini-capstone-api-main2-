class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :discount, :description, :tax, :total, :supplierinfo, :images, :primary_image

  has_many :categories
end
