set :user, "adam"

set :application, "credit_bills"

role :app, "bills.kreditmarket.com"
role :web, "bills.kreditmarket.com"
role :db,  "bills.kreditmarket.com", :primary => true

set :scm, "git"
set :repository,  "git@github.com:adammiribyan/credit_bills.git"
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :keep_releases, 5
set :use_sudo, false

set :branch, "master"
set :deploy_to, "/home/#{user}/webapps/#{application}"

namespace :deploy do
  desc "Restart application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end