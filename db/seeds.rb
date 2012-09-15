# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = Course.create(:name => "Biology 101")
Student.create(:name => "Rueben Ahmed", :course_id => courses.id)
Student.create(:name => "Mike Anderson", :course_id => courses.id)
Student.create(:name => "Ichabod Crane", :course_id => courses.id)
Student.create(:name => "Michelle Jacobs", :course_id => courses.id)
Student.create(:name => "Gene Powellhat", :course_id => courses.id)
Student.create(:name => "Matthew Jennifers", :course_id => courses.id)
Student.create(:name => "Stevie Nix", :course_id => courses.id)
Student.create(:name => "Dan Mueller", :course_id => courses.id)
Student.create(:name => "Chaz Gibson", :course_id => courses.id)
Student.create(:name => "Frank Donatello", :course_id => courses.id)
Student.create(:name => "Missy Luna", :course_id => courses.id)
Student.create(:name => "Laura Halsey", :course_id => courses.id)
Student.create(:name => "Perry Mason", :course_id => courses.id)
Student.create(:name => "Tony Valente", :course_id => courses.id)
Student.create(:name => "Geek Astudent", :course_id => courses.id)
Student.create(:name => "Lucy Amaz", :course_id => courses.id)
