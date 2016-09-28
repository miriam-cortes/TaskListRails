class TasksController < ApplicationController
  def index
    @tasks = TasksController.alltasks
  end

  def new
  end

  def show
    @tasks = TasksController.alltasks
    @mytask = nil

    @tasks.each do |task|
      number = params[:id].to_i
      if task[:id] == number
        @mytask = task
      end
    end
    if @mytask == nil
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def delete
  end

  def edit
  end

  def update
  end

  def create
  end

  def self.alltasks
    [
      { id:     1,
        thing:  "Brush hair",
        status: false,
        complete_date:   nil},
      { id:     2,
        thing:  "Go to ADA",
        status: false,
        complete_date: nil},
      { id:     3,
        thing:  "Make lame developer joke",
        status: true,
        complete_date: nil}
    ]
  end

end
