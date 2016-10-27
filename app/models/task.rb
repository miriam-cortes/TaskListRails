class Task < ActiveRecord::Base
  belongs_to :user
  validates :thing, presence: :true
  validates_with MyValidator

end
