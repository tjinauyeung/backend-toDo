# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tasks = Task.create([{description: "This needs doing", done: true, project_id: "1"},{description: "buy bread", done: false, project_id: "1"}])
Project.create( title: "First project", description: "This is a description of the first project." )
