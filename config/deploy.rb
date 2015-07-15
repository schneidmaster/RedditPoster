set :application, 'RedditPoster'

set :scm, :copy

set :include_dir, [
  '.env',
  'bot.rb',
  'Gemfile',
  'Gemfile.lock',
  'LICENSE.txt',
  'post.rb',
  'config/schedule.rb',
  'posts/*.md'
]

namespace :deploy do
  after :deploy, :update_cron do
    on roles(:app) do
      within release_path do
        execute :bundle, :install
        execute :bundle, :exec, :whenever, '-w'
      end
    end
  end
end
