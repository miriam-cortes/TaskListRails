class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id].to_i)
  end

  def delete
    task.destroy
    redirect_to :index
  end

  def task
    @task ||= Task.find(params[:id].to_i)
  end

  def edit
    show
  end

  def update
    @task = task
    @task.thing = params[:thing]
    @task.description = params[:description]
    @task.status = params[:status]
    @task.save
    redirect_to :index
  end

  def create
    @params = params
    @task = Task.new
    @task.thing = params[:task][:thing]
    @task.description = params[:task][:description]
    @task.status = params[:task][:status]
    if @task.status
      @task.complete_date = Time.now
    end
    @task.save
    redirect_to :index
  end

  def mark_complete
    @task = task
    # show
    @task.status = true
    @task.complete_date = Time.now
    @task.save
    redirect_to :index
  end

  def mark_incomplete
    show
    @task = task
    @task.status = false
    @task.complete_date = nil
    @task.save
    redirect_to :index
  end

  private
  def post_params
    params.require(:task).permit(:thing, :description)
  end

end
