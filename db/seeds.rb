# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# site users
seeder = User.create({:email => "seeder_sprowty@mailinator.com",
             :password => "password",
             :password_confirmation => "password",
             :username => "seeder"})

User.create({:email => "sprowter_sprowty@mailinator.com",
             :password => "password",
             :password_confirmation => "password",
             :username => "sprowter"})

project = Project.create({:user_id => seeder.id,
                :title => "Test Project",
                :description => "Example project",
                :city => "Brooklyn",
                :state => "NY",
                :tags => "project",
                :price => 3245.25,
                :due_date => DateTime.now()+2.months})

project.post

CATEGORIES = ["Accounting/Finance", "Customer Services", "Design,Fashion", "Location Based", "Marketing/PR", "Medical/Health", "Music/Audio", "Organizing/Planning", "Other", "Photography", "Programming/Development", "Research", "Social Media", "Translation", "Video", "Writing"]

CATEGORIES.each do |c|
  Category.create({:name=> c})
end
