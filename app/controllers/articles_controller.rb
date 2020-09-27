class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @articles = Article.page(params[:page]).per(6)
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
    if article.save
      redirect_to new_article_path, notice: "投稿しました"
    else
      redirect_to new_article_path, notice: "投稿内容に誤りがあります"
    end
  end

  def update
    article = Article.find(params[:id])
    article.user_id = current_user.id
    user = current_user
    if article.update(article_params)
      redirect_to article_path(article), notice: "編集内容を保存しました"
    else
      redirect_to edit_article_path(article), notice: "編集内容に誤りがあります"
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path, notice: "削除しました"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image)
  end

end
