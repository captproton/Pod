class ArticlesController < ApplicationController
  before_filter :require_user
  # All signed-in member can see the "show" and "index" pages
  all_access_to   :only => [:show,:index]
  # Editor has access to "new", "edit" and "create" and "update" but not "destroy"
  grant_access_to :staff, :except => [:destroy]
  
  grant_access_to :admin
  
  def index
    if params[:context]
      tagging = params[:context].singularize
      @articles = Article.find_in_context(tagging, 'spiels')
    else
      @articles = Article.find(:all, :order => 'updated_at DESC') 
    end
    
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    @article.author       = current_user
    @article.tag_list   = params[:article][:tag_list]   if params[:article][:tag_list] 
    @article.spiel_list = params[:article][:spiel_list] if params[:article][:spiel_list]
    @article.blog_list  = params[:article][:blog_list]  if params[:article][:blog_list]
    @article.help_list  = params[:article][:help_list]  if params[:article][:help_list]
    @article.classroom_list = params[:article][:classroom_list] if params[:article][:classroom_list]

    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      render :action => 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    @article.author     = current_user
    @article.tag_list   = params[:article][:tag_list]   if params[:article][:tag_list] 
    @article.spiel_list = params[:article][:spiel_list] if params[:article][:spiel_list]
    @article.blog_list  = params[:article][:blog_list]  if params[:article][:blog_list]
    @article.help_list  = params[:article][:help_list]  if params[:article][:help_list]
    @article.classroom_list = params[:article][:classroom_list] if params[:article][:classroom_list]
    
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to @article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_url
  end
end
