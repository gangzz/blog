class WelcomeController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.where(parent: nil)
    @articleSize = Article.count
    @jsondata = category_json(@categories).to_json()
  end
  
  def toLogin
    render 'loginform.html.erb'
  end
  
  def login
    user_name = params[:name] 
    if user_name == 'wangyang'
      session[:username] = user_name
      render plain: 'success'
    else
       @warn = 'Invalidate account!'
      toLogin
    end
  end
  
  def logout
    session[:username] = nil
    redirect_to '/pages'
  end
  
  def category_json(categories)
    list = []
    categories.each do |category|
      item = {name: category.name}
      if category.children
        item[:children] = category_json(category.children)
      else
           item[:children] = []
      end
      list.push item
    end
    return list
  end
end
