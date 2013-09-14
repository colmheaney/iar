server "146.185.142.83", :app, :web, :db, :primary => true
set :deploy_to, "/var/www/apps/#{application}"