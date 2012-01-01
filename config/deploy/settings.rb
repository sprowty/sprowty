set :application, "sprowty"
set :deploy_to, "/var/www/apps/sprowty.com"
default_run_options[:pty] = true
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
ssh_options[:keys]
set :keep_releases, 3
set :scm, :git
set :scm_verbose, true
set :repository, "git@github.com:alorus/sprowty.git"
set :scm_username, "ubuntu"
set :git_enable_submodules, :true
set :deploy_via, :remote_cache
set :migrate_target, 'current'
