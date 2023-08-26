class CartedProductSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :status
  belongs_to :product
end
