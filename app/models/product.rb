class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 5..500 }

  #def supplier
  # Supplierinfo.find_by(id: supplierinfo)
  #end
  belongs_to :supplierinfo
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  def discount
    if price.to_i < 55000
      answer = "Special Offer"
    else
      answer = "Not included in special offer"
    end
    answer
  end

  def tax
    price.to_i * 0.09
  end

  def total
    price.to_i + tax
  end

  def primary_image
    if images.length > 0
      images[0].url
    else
      "https://www.flexx.co/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png"
    end
  end
end
