class TasksController < ApplicationController
  respond_to :html, :xml, :js

  def create
    puts "Hello"

    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    puts "New task"
    puts @task
    if @task.save
      flash[:message] = "task created"
      redirect_to list_url(@list)
     # redirect_to :action => 'show', :id => :list_id
    else
      flash[:message] = "task not created"
      redirect_to list_url(@list)
    end

  end

  def index

  end


end
