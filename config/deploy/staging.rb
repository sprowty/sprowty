task :staging do
  set :branch, :master
  set :stage, "174.143.240.100"
  set :user, "deployer"
  set :runner, "deployer"
  set :domain, "174.143.240.100"
  set :rails_env, "staging"
  set :port, 22
  role :web, domain
  role :app, domain
  role :db, domain, :primary => true
end
