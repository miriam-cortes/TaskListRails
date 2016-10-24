class Task < ActiveRecord::Base
  belongs_to :user
  validates :thing, presence: :true
  validates_with MyValidator

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
end
