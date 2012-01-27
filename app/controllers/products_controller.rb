class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def available
    @products = Product.available
    render 'index'
  end
  
  def unavailable
    @products = Product.unscoped.where('status <> ?', 'Available')
    render 'index'
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.update_attribute(:deleted, true)
    redirect_to products_path
  end
end
