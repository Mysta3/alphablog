# frozen_string_literal: true
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] #-> performs this method before anything else is done.
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  #show one
  def show
      # byebug # -> pauses web server, can be used to see params for the route
     
  end

  # show all
  def index
      # instance variable to make it available in views
      @articles = Article.paginate(page: params[:page], per_page: 3)
  end


  def new
      @article = Article.new
  end

  def edit
     
  end
  def create
      @article = Article.new(article_params)
      @article.user = current_user
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
      params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin? ##check if current user is an admin.
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
end