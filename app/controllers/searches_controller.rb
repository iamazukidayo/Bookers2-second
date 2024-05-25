class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @content = params[:content]
    if @range == "User"
      @users = User.looks(params[:search], params[:word], params[:content])
      render "searches/search_result"
    else
      @books = Book.looks(params[:search], params[:word], params[:content])
      render "searches/search_result"
    end
  end
end
