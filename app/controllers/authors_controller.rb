class AuthorsController < ApplicationController
  def index
    @authors = Author.ordered_by_last_name
  end

  def show
    @author = Author.find(params[:id])
    
  end
end
