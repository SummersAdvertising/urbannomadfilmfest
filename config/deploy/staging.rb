set :application, 	"urbannomadfilmfest"
set :domain, 		"summers.com.tw"
set :repository, 	"git@github.com:SummersAdvertising/urbannomadfilmfest.git"
set :deploy_to,		"/home/deploy/urbannomadfilmfest"

role :app,		domain
role :web,	domain
role :db, 		domain,	:primary => true

set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"
set :scm, :git
set :branch, "staging"
set :scm_verbose, true
set :use_sudo, false
set :user, "deploy"
set :password, "1qaz2wsx"
set :group, "deploy"

default_environment["PATH"] = "/opt/ree/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"

namespace :deploy do
	desc "restart"
	task :restart do
		run "ln -s  #{shared_path}/uploads/ #{current_path}/public/uploads"
		
		run "cd #{current_path};rake db:migrate RAILS_ENV=production; RAILS_ENV=production rake cache:clear "
	end
end

desc "Create database.yml and asset packages for production"
before("deploy:finalize_update") do
	db_config = "#{shared_path}/config/database.yml.production"
	#db_config = "#{db_config} #{release_path}/config/database.yml.production"
	run "cp #{db_config} #{release_path}/config/database.yml"
	run "cd #{release_path}; RAILS_ENV=production rake db:create"
end

