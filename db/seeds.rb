# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# DO THIS WHEN YOUR SEED FILE ISN'T DOING WHAT IT'S SUPPOSED TO #
myTask = Task.new(thing: "My Title", description: "Something")
myTask.save

myTask.errors.each do |attribute, message|
  Rails.logger.error "#{attribute}: #{message}"
end

myTask = Task.new(description: "Something")
myTask.save

myTask.errors.each do |attribute, message|
  Rails.logger.error "#{attribute}: #{message}"
end
