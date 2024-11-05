class Admin::CategoriesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    # Instantiate a new category object for the form
    @category = Category.new
  end

  def create
    # Create a new category from form input data
    @category = Category.new(category_params)

    if @category.save
      # Redirect to admin categories page with success message
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      # If creation failed, re-render the 'new' form
      render :new
    end
  end

  private

  # Strong parameters to allow specific category fields
  def category_params
    params.require(:category).permit(:name)
  end
  
end
