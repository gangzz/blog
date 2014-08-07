class CategoriesController < ApplicationController
  
  def index
    @categories = Category.where(parent: nil)
  end
  
  def create
    @parentId = params[:pid]
    if(@parentId)
      @parent = Category.find(params[:pid])
      @parent.children.create(category_param)
      redirect_to category_path(@parent)
    else
      Category.create(category_param)
      redirect_to categories_path
    end
    
  end
  
  def show
    @parent = Category.find(params[:id])
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path 
  end
  
  def category_param
    params.require(:category).permit(:name, :parent)
  end
end
