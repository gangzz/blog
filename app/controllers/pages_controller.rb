class PagesController < ApplicationController
  
  layout "pages"
  before_filter :set_category
  
  def index
    redirect_to "/pages/page/1"
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def list
    @category_id = params[:category_id]
    @page_idx = params[:page_num].to_i
    @articleSize = Article.count
    offset = (@page_idx - 1 ) * 10
    if @category_id
      @articles =  Article.where({:category_id => @category_id}).limit(10).offset(offset);
    else
      @articles = Article.limit(10).offset(offset);
    end
   
    /render plain: @page_idx.inspect + "," + offset.inspect/
    render :index
  end
  
  def category_json(categories)
    list = []
    categories.each do |category|
      item = {name: category.name, id: category.id}
      if category.children
        item[:children] = category_json(category.children)
      else
           item[:children] = []
      end
      list.push item
    end
    return list
  end
  
  
  def set_category
    categories = Category.where(parent: nil)
    @jsondata = category_json(categories).to_json()
  end
end
