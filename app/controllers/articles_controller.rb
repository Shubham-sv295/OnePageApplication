class ArticlesController < ApplicationController
  def index
    @articles = current_user.articles
    @article = Article.new
  end

  def new
    @article = current_user.article.new
  end
  def create
    @article =current_user.articles.new(article_params)
    byebug
    if @article.save
      respond_to do |format|
        TwilioTextMessenger.new().call
        format.html { redirect_to @articles, notice: 'Article was successfully created.' }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @articles, notice: 'Article was successfully created.' }
          format.js
        end
      end
  end

  def show
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Article was successfully Deleted.' }
        format.js
      end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description);
  end

end
