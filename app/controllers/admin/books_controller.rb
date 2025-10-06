class Admin::BooksController < ApplicationController
  def index
    #@books=Book.all
    @books=Book.order(title: :asc)
  end
  

  def show
  end
end
