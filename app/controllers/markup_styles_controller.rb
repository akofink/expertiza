class MarkupStylesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  def list
    @markup_styles = MarkupStyle.paginate(:page => params[:page],:per_page => 10)
  end

  def show
    @markup_style = MarkupStyle.find(params[:id])
  end

  def new
    @markup_style = MarkupStyle.new
  end

  def create
    @markup_style = MarkupStyle.new(params[:markup_style])
    begin
    @markup_style.save!
      flash[:notice] = 'MarkupStyle was successfully created.'
      redirect_to :action => 'list'
    rescue
      render :action => 'new'
    end
  end

  def edit
    @markup_style = MarkupStyle.find(params[:id])
  end

  def update
    @markup_style = MarkupStyle.find(params[:id])
    if @markup_style.update_attributes(params[:markup_style])
      redirect_to :action => 'show', :id => @markup_style
      flash[:notice] = 'MarkupStyle was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    MarkupStyle.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
