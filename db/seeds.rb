# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(:email => 'guest@devboard.com', :password => 'password', :name => 'Guest')
Profile.create!(:user_id => user.id, :name => user.name, :email => user.email, :user_name => 'guest')
