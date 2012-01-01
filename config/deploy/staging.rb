task :staging do
  set :branch, :master
  set :stage, "finagle.sprowty.com"
  set :user, "ubuntu"
  set :runner, "ubuntu"
  set :domain, "finagle.sprowty.com"
  set :rails_env, "staging"
  set :port, 22
  role :web, domain
  role :app, domain
  role :db, domain, :primary => true
end
