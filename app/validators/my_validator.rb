class MyValidator < ActiveModel::Validator
  def validate(task)
    unless task.complete_date == nil
      task.errors[:complete_date] << 'The complete date cant be nil!'
    end
  end
end
