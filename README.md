# RedditPoster

A Reddit bot to make scheduled subreddit posts, implemented in Ruby.

## Usage

1. Clone the bot onto a server. If you don't have one, I recommend an Ubuntu server on [DigitalOcean](http://digitalocean.com/) ($5/mo). Or, if you message me on Reddit (/u/schneidmaster) and ask nicely I might let you use mine.
2. Install ruby and bundler: `sudo apt-get install ruby bundler`
3. Run `bundle` to install the required gems.
4. Copy `.env.example` to `.env` and fill it in with your bot's username, password, and subreddit to post in. 
5. Copy `schedule.example.rb` to `schedule.rb` and fill it in with each scheduled post you'd like the bot to make. 
6. For each post, create a corresponding markdown file in the `posts/` folder with the post text. For example, if you create a Saturday post like `runner "Bot.post!('Saturday Thread', 'saturday')"`, you would create `posts/saturday.md` with the post text. You can use [Reddit's flavor of markdown](https://www.reddit.com/r/reddit.com/comments/6ewgt/reddit_markdown_primer_or_how_do_you_do_all_that/c03nik6) in post content.
7. Run `bundle exec whenever -w` to write your schedule to your server's cron file. (Repeat this command if you ever update the post schedule.)

## Capistrano Deployment

To make it easier to deploy changes, RedditPoster includes a Capistrano deployment recipe. This lets you edit your post messages and schedule on your computer and then automatically deploy, bundle, and update the cron file. To use Capistrano:

1. Copy `production.example.rb` to `production.rb` and fill in your server's IP address and SSH user.
2. Copy `deploy.example.rb` to `deploy.rb` and fill in the path where you want RedditPoster to live on your server.
3. Make any updates to your post texts and schedule, then run `cap production deploy` to deploy the changes.

## Contributing

1. Fork it ( https://github.com/schneidmaster/RedditPoster/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request