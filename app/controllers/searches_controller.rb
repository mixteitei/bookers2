class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @word = params[:word]
    
    if @range == '1'
      @users = User.search(params[:search], @word)
    else
      @books = Book.search(params[:search], @word)
    end
  end
end
