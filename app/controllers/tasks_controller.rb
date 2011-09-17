class TasksController < ApplicationController
  respond_to :html, :xml, :js

  def create
    @list = List.find(:list_id => @list.id)
    @task = @list.tasks.new
    @task.description = :value
    if @task.save
      flash[:message] = "task created"
      redirect_to :action => 'show', :id => :list_id
    else
      flash[:message] = "task not created"
      redirect_to list_url(@list)
    end
  end

  def index

  end
end
