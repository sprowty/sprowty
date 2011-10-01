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

# bids

# keywords
1.upto(20).each do |k|
  p "...creating keyword #{k}"
  Keyword.create({:name => "keyword#{k}"})
end
