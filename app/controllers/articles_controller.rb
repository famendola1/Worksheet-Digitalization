class ArticlesController < ApplicationController
	def index
	  @articles = Article.all
	end

	def new 
	end

	def create
	  @article = Article.new(article_params)
	 
	  @article.save
	  redirect_to action: "index"
	end
	
=begin
	def destroy
  	  @article = Article.find(params[:id])
  	  @article.destroy
 
 	  redirect_to articles_path
 	end
=end

	private
	  def article_params
	  	params.require(:article).permit(:q1)
	  end

end
