class ManagementsController < ApplicationController
  before_filter :is_login
  
  def index
    
  end
  
  protected
  def is_login
    if session[:username]
      return true
    else
      redirect_to :toLogin
    end
  end
end
