class TasksController < ApplicationController
  before_action :find_user
  before_action :find_task, only: [:show, :edit, :update, :mark_complete, :mark_incomplete, :destroy]

  def index
    @tasks = Task.where(user_id: @user.id)
  end

  def new
    @task = Task.new
    @post_path = user_tasks_path(@user.id)
    @post_method = :post
  end

  def show
  end

  def destroy
    @task.destroy
    redirect_to user_path(@user)
  end

  def edit
    @post_path = user_task_path(@user.id, @task.id)
    @post_method = :put
  end

  def update
    @task.thing = params[:task][:thing]
    @task.description = params[:task][:description]
    @task.status = params[:task][:status]
    @task.save
    redirect_to user_path(@user)
  end

  def create
    @params = params
    @task = Task.new
    @task.thing = params[:task][:thing]
    @task.description = params[:task][:description]
    @task.status = params[:task][:status]
    @task.user_id = @user.id
    if @task.save
      redirect_to user_task_path(@user, @task)
    else
      @error = "Did not save successfully. Please try again."
      @post_path = user_tasks_path
      @post_method = :post
      render :new
    end
  end

  def mark_complete
    @task.status = true
    @task.save
    redirect_to user_path(@user)
  end

  def mark_incomplete
    @task.status = false
    @task.save
    redirect_to user_path(@user)
  end

  private
  def find_user
    if User.exists?(params[:user_id].to_i) == true
      return @user = User.find(params[:user_id].to_i)
    else
      render :status => 404
    end
  end

  def find_task
    @task = Task.find_by(user_id: @user.id, id: params[:id])
  end

  def post_params
    params.require(:task).permit(:thing, :description)
  end

end
