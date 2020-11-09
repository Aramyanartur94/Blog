class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def new
  end 

  def create
    @article = Article.new(article_params)
    if @article.valid? # можно не добавлять, так как в методе save, есть валидация(можно написать просто if article.save...)
      @article.save
      redirect_to @article
      #render plain: params[:article].inspect
    else
      render action: 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
   
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
      if @article.update(article_params)
      redirect_to @article
      #render plain: params[:article].inspect
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


   private

   def article_params
    params.require(:article).permit(:title, :text)
   end

end
