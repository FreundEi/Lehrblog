class ArticleCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    article = Article.find(params[:article_id])
    comment = current_user.article_comments.new(article_comment_params)
    comment.article_id = article.id
    comment.save
    redirect_to article_path(article)
  end

  def destroy
    comment = ArticleComment.find_by(id: params[:id], article_id: params[:article_id])
    comment.destroy
    redirect_to articles_path
  end

  private
  def article_comment_params
    params.require(:article_comment).permit(:comment)
  end
end
