# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# site users
1.upto(10).each do |x|
  p "...creating user #{x}"
  User.create({:email => "testuser#{x}_sprowty@mailinator.com",
               :password => "password#{x}",
               :password_confirmation => "password#{x}",
               :username => "testuser#{x}"})
end

# projects
User.all.each do |x|
  p "...creating project #{x}"
  Project.create({:user_id => x.id,
                  :title => "Project #{x.id}",
                  :description => "Example project",
                  :city => "City#{x.id}",
                  :state => "OK",
                  :tags => "project",
                  :price => 3245.25,
                  :due_date => DateTime.now()+2.months})
end

# post every other project (lets have some variety eh?)
%w(1 3 5 7 9).each do |x|
  p "...posting project #{x}"
  p = Project.find(x)
  p.post
end

# bids

# keywords
1.upto(20).each do |k|
  p "...creating keyword #{k}"
  Keyword.create({:name => "keyword#{k}"})
end

#categories
CATEGORIES = ["Accounting/Finance", "Customer Services", "Design,Fashion", "Location Based", "Marketing/PR", "Medical/Helath", "Music/Audio", "Organzing/Planning", "Other", "Photography", "Program    ing/Development", "Research", "Social Media", "Translation", "Video", "Writing"]

CATEGORIES.each do |c|
  Category.create({:name=> c})
end
