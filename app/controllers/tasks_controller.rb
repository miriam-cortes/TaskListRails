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
    @task.thing = params[:task][:thing]
    @task.description = params[:task][:description]
    @task.status = params[:task][:status]
    @task.save
    redirect_to :index
  end

  def create
    @params = params
    @task = Task.new
    @task.thing = params[:task][:thing]
    @task.description = params[:task][:description]
    @task.status = params[:task][:status]
    @task.user_id = @user.id
    if @task.status
      @task.complete_date = Time.now
    end
    @task.save
    redirect_to :index
  end

  private
  def post_params
    params.require(:task).permit(:thing, :description)
  end

end
