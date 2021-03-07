class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name).paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    # whitelisting params
    params.require(:category).permit(:name)
  end
end