class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(cat_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category saved!'
    else
      render :new
    end
  end

  private

  def cat_params
    params.require(:category).permit(
      :name
    )
  end

end