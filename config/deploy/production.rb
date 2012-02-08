task :production do
  set :branch, :master
  set :stage, "finagle.sprowty.com"
  set :user, "deployer"
  set :runner, "deployer"
  set :domain, "finagle.sprowty.com"
  set :rails_env, "production"
  set :port, 22
  role :web, "174.143.240.100"
  role :app, "174.143.240.100"
  role :db, "174.143.240.100", :primary => true
end
