class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    article = Article.find(params[:article_id])
    favorite = current_user.favorites.new(article_id: article.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    article = Article.find(params[:article_id])
    favorite = current_user.favorites.find_by(article_id: article.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
