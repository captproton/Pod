class DocumentsController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def index
    sort_by = (params[:order] == 'starts_at' ? 'starts_at desc' : 'name')
    @documents = Document.find(:all, :order => 'published_on DESC') 
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
    @document.paper_list = params[:document][:paper_list]
    @document.tag_list = params[:document][:tag_list]
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
