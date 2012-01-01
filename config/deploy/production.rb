task :production do
  set :branch, :master
  set :stage, "beta.sprowty.com"
  set :user, "ubuntu"
  set :runner, "ubuntu"
  set :domain, "beta.sprowty.com"
  set :rails_env, "staging"
  set :port, 22
  role :web, domain
  role :app, domain
  role :db, domain, :primary => true
end
