set :application, "todo list"
set :repository,  "git@heroku.com:pure-sword-9146.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'deploy'
set :use_sudo, false

role :web, "pure-sword-9146.herokuapp.com"                          # Your HTTP server, Apache/etc
role :app, "pure-sword-9146.herokuapp.com"                          # This may be the same as your `Web` server
role :db,  "pure-sword-9146.herokuapp.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end