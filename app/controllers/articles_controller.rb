class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    user = current_user
    article.save
    redirect_to articles_path
  end

  def update
    article = Article.find(params[:id])
    article.user_id = current_user.id
    user = current_user
    article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image)
  end

end
