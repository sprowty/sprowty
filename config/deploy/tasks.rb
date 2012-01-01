task :disable_web, :roles => :app do
  run "ln -nfs #{shared_path}/system/maintenance.html #{current_path}/public/maintenance.html"
end
task :enable_web, :roles => :app do
  run "rm #{current_path}/public/maintenance.html"
end

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

task :copy_config_files, :roles => :app do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", :copy_config_files
