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
        description: "grab comb and drag it through your damn hair...seriously? Is this a question you have??? #failedatlife",
        status: false,
        complete_date:   nil},
      { id:     2,
        thing:  "Go to ADA",
        description: "leave house, turn right, walk 2 blocks, board either 11 or 49, get off at 4th, walk south however many blocks.",
        status: false,
        complete_date: nil},
      { id:     3,
        thing:  "Make lame developer joke",
        description: "self explanatory",
        status: true,
        complete_date: nil}
    ]
  end

end
