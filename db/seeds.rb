# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{name:'Arts'},{name:'Biology'},{name:'Business & Managment'},{name:'Chemistry'},{name:'Computer Science'},{name:'Economics & Finance'},{name:'Education'},{name:'Food'},{name:'Law'},{name:'Mathematics'},{name:'Medicine'},{name:'Social Sciences'},{name:'Data Analysis'},{name:'Earth Science'}])
Category.create([{name: 'CS: Artificial Intelligence'},{name: 'CS: Software Engineering'},{name: 'CS: Systems & Security'},{name: 'CS: Theory'}])
# cs = Category.where(name: 'Computer Science').first

# Category.create({name: 'CS: Artificial Intelligence', parent: cs},{name: 'CS: Software Engineering', parent: cs},{name: 'CS: Systems & Security', parent: cs},{name: 'CS: Theory', parent: cs})

