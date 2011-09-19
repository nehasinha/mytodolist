class ListsController < ApplicationController
  respond_to :html, :xml, :js
  before_filter :authenticate_user!

  def index
    respond_with(@lists = List.all)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:message] = "List created"
      redirect_to :action => 'index'
    else
      flash[:message] =" List not created"
      redirect_to :action => 'new'
    end
  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:message] = "List updated"
      redirect_to :action => 'index'
    else
      flash[:message] =" List not updated"
      redirect_to edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List deleted"
      redirect_to :action => 'index'
    else
      flash[:error] =" List not updated"
    end
  end
end
