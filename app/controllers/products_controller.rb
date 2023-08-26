class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    pp current_user
    product = Product.all.order(:id)
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplierinfo_id: params[:supplier_id],
    )
    if product.save
      Image.create(url: params[:image_url], product_id: product.id)
      # CategoryProduct.create(product_id: product.id, category_id: params[:category_id])
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.supplierinfo = params[:supplier_id] || product.supplierinfo
    if product.save
      Image.create(url: params[:image_url], product_id: product.id)
      render json: product
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { messege: "product sucessfully deleted" }
  end
end
