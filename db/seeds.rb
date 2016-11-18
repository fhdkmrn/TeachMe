# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:name => "Fahad Fudgy Kamran", :email => "admin@communitygrows.org")
User.create!(:name => "Nisha NishNish Bagladesh", :email => "user@communitygrows.org")
User.create!(:name => "James Felix Jiang", :email => "admin@communitygrows.org")
User.create!(:name => "Tommy The Rapper", :email => "user@communitygrows.org")

Course.create!(:name => "Machine Structures", :department => "CS", :course_no => "61C")
Course.create!(:name => "The Structure and Interpretation of Computer Programs", :department => "CS", :course_no => "61A")
Course.create!(:name => "Data Structures", :department => "CS", :course_no => "61B")
Course.create!(:name => "Discrete Mathematics and Probability Theory", :department => "CS", :course_no => "70")
Course.create!(:name => "Efficient Algorithms and Intractable Problems", :department => "CS", :course_no => "170")
Course.create!(:name => "Introduction to Database Systems", :department => "CS", :course_no => "186")
