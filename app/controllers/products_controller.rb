class ProductsController < ApplicationController
  
  def show

  end

  def new
    @product = Product.new
    @user_names = Client.all.map { |u| u.name }
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to product_path(producct)
    else
      notice :error
    end  
  end  

  private

  def product_params
    params.require(:product).permit(:user_email, :user_name, :product_name, :product_number, :price, :total_hours, :subscription)
  end  

end
