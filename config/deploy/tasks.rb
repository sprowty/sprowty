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

desc 'run remote command'
task :remote do
    command=ARGV.values_at(Range.new(ARGV.index('remote')+1,-1))
      run "cd #{current_path}; #{sudo_call} RAILS_ENV=#{rails_env} #{command*' '}"
        exit(0)
end

desc 'tails the log'
task :tail_log, :roles => :app do
  stream("tail -f #{shared_path}/log/#{rails_env}.log")
end

desc "remote console"
task :console, :roles => :console_host do
  input = ''
  run "cd #{current_path} && rails console #{rails_env}" do |channel, stream, data|
    next if data.chomp == input.chomp || data.chomp == ''
    print data
    channel.send_data(input = $stdin.gets) if data =~ /:\d{3} (\*|>)/
  end
end

after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", :copy_config_files
