set :application, 'RedditPoster'

set :scm, :copy

set :deploy_to, '/some/server/path'

namespace :deploy do
  after :deploy, :update_cron do
    on roles(:app) do
      within release_path do
        execute :bundle, :exec, :whenever, '-w'
      end
    end
  end
end