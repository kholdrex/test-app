class HomeController < ApplicationController
  def index
    @articles = Article.page(params[:page]).per(30)
  end
end
