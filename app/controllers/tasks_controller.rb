class TasksController < ApplicationController

  attr_accessor :completed

  before_filter :find_list
  respond_to :html, :xml, :js

  def create
    @task = @list.tasks.new(params[:task])

    if @task.save
      flash[:message] = "task created"
      redirect_to list_url(@list)
    else
      flash[:message] = "task not created"
      redirect_to list_url(@list)
    end

  end

  def complete
    @task = @list.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to list_url(@list)
  end

  def destroy
    puts "Call to destroy"
    @task = @list.tasks.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task deleted"
      redirect_to list_url(@list)
    else
      flash[:error] =" Task not deleted"
      redirect_to list_url(@list)
    end
  end

  private
  def find_list
      @list = List.find(params[:list_id])
  end
end
