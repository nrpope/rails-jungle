class CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS']

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
