# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Category.delete_all

CATEGORIES = ["Accounting/Finance", "Customer Services", "Design,Fashion", "Location Based", "Marketing/PR", "Medical/Health", "Music/Audio", "Organizing/Planning", "Other", "Photography", "Programming/Development", "Research", "Social Media", "Translation", "Video", "Writing"]

CATEGORIES.each do |c|
  Category.create({:name=> c})
end

["seeder","sprowter"].each do |user_str|

  if User.where(:email => "#{user_str}_sprowty@mailinator.com").length > 0
    User.where(:email => "#{user_str}_sprowty@mailinator.com").first.destroy
  end

  user = User.create({:email => "#{user_str}@mailinator.com",
                      :password => "password",
                      :password_confirmation => "password",
                      :is_admin => false})

  profile = user.build_profile({:first_name => user_str.humanize,
                                :last_name => 'User',
                                :zipcode => '73069',
                                :picture => File.open(File.join(Rails.root,"db","seed_files","#{user_str}_profile.jpg"))})
  profile.save!
  user.confirm!
end

["admin"].each do |user_str|

  if User.where(:email => "#{user_str}@mailinator.com").length > 0
    User.where(:email => "#{user_str}@mailinator.com").first.destroy
  end

  user = User.create({:email => "#{user_str}@mailinator.com",
                      :password => "password",
                      :password_confirmation => "password",
                      :is_admin => true})

  profile = user.build_profile({:first_name => user_str.humanize,
                                :last_name => 'User',
                                :zipcode => '73069',
                                :picture => File.open(File.join(Rails.root,"db","seed_files","#{user_str}_profile.jpg"))})
  profile.save!
  user.confirm!
end


posted = Project.create({:user_id => User.where(:email => 'seeder@mailinator.com').first.id,
                         :title => "E-Commerce Website",
                         :description => "e-commerce website with all the bells and whistles.",
                         :city => "Brooklyn",
                         :state => "NY",
                         :category => "Other",
                         :price => 3245,
                         :due_date => DateTime.now()+2.months})
posted.post
