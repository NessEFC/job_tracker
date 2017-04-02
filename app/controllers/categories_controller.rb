class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You created a new #{@category.title} category!"
      redirect_to category_path(@category)
    else
      flash.notice = "The '#{@category.title}' category already exists! Please try again."
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash.notice = "The '#{@category.title}' category has been updated!"
      redirect_to category_path(@category)
    else
      flash.notice = "The category could not be updated. Make sure the category title doesn't already exist."
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
