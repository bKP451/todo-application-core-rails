# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


first_project = Project.create(project_name: "Sand in my shoes")
second_project = Project.create(project_name: "Still in my mind")

Task.create(
  task_name: "I want to travel the world",
  task_description: "When will I fly ?",
  project: first_project
)

Task.create(
  task_name: "You are still on my mind",
  task_description: "You are no angel still you are on my mind.",
  project: second_project
)