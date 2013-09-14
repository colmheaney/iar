require 'capistrano/ext/multistage'
require "rvm/capistrano"
require "bundler/capistrano"

set :application, "iar"

set :rvm_ruby_string, "2.0.0-p247"
set :normalize_asset_timestamps, false
set :rails_env, "production"
set :repository, "git://github.com/colmheaney/iar.git"
set :scm, :git
set :scm_passphrase, ""
set :use_sudo, false
set :deploy_via, :remote_cache
set :user, "colm"

set :stages, ["staging", "production"]
set :default_stage, "staging"

ssh_options[:port] = 3229
default_run_options[:pty] = true

after "deploy:restart", "deploy:cleanup"

 
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end






