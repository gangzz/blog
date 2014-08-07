class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id]);
    @comment = @article.comments.create(comment_param);
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  def comment_param
    params.require(:comment).permit(:commentor, :body)
  end
end
