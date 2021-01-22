# frozen_string_literal: true
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] #-> performs this method before anything else is done.

  #show one
  def show
      # byebug # -> pauses web server, can be used to see params for the route
      # -> dynamically retrieve the article
  end

  # show all
  def index
      # instance variable to make it available in views
      @articles = Article.all
  end


  def new
      @article = Article.new
  end

  def edit
     
  end
  def create
      @article = Article.new(article_params)
      if @article.save
          flash[:notice] = "Article was created successfully."
          redirect_to @article
      else  
          render 'new' # render the new form if article save fails
      end
  end

  def update
     
     if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
     else
      render 'edit'
     end
  end

  def destroy 
      @article.destroy
      redirect_to articles_path # articles_path -> redirects to /articles 
  end

  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
      params.require(:article).permit(:title, :description)
  end
end