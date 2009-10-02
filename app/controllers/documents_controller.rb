class DocumentsController < ApplicationController
  before_filter :require_user
  # All signed-in member can see the "show" and "index" pages
  all_access_to   :only => [:show,:index]
  # Editor has access to "new", "edit" and "create" and "update" but not "destroy"
  grant_access_to :staff, :except => [:destroy]
  
  grant_access_to "admin"
  
  def index
    if params[:context]
      tagging = params[:context].singularize
      @documents = Document.find_in_context(tagging, 'papers')
    else
      @documents = Document.find(:all, :order => 'published_on DESC') 
    end
  end
  
  def show
    @document = Document.find(params[:id])
  end
  
  def new
    @document = Document.new
  end
  
  def create
    @document = Document.new(params[:document])
    @document.user = current_user
    @document.paper_list = params[:document][:paper_list] if params[:document][:paper_list]
    @document.tag_list = params[:document][:tag_list] if params[:document][:tag_list]
    if @document.save
      flash[:notice] = "Successfully created document."
      redirect_to @document
    else
      render :action => 'new'
    end
  end
  
  def edit
    @document = Document.find(params[:id])
  end
  
  def update
    @document = Document.find(params[:id])
    @document.user = current_user
    @document.paper_list = params[:document][:paper_list]
    @document.tag_list = params[:document][:tag_list]
    if @document.update_attributes(params[:document])
      flash[:notice] = "Successfully updated document."
      redirect_to @document
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:notice] = "Successfully destroyed document."
    redirect_to documents_url
  end
end
