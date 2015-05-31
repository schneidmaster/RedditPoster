# Require RedditKit API
require 'redditkit'

# Load configuration
require 'dotenv'
Dotenv.load

class Bot
  class << self
    def post!(title, name, options)
      # Generate the title
      title = "#{title} [#{Time.now.strftime('%-m/%-d/%Y')}]" if options[:append_date]

      # Load the content
      content = contents("posts/#{name}.md")

      # Log in
      client = call_guarantee { RedditKit::Client.new ENV['ACCOUNT_USERNAME'], ENV['ACCOUNT_PASSWORD'] }

      # Submit the link
      call_guarantee { client.submit title, ENV['SUBREDDIT'], text: content }

      # Find the link
      link =  call_guarantee { client.links(ENV['SUBREDDIT'], category: :new).find { |l| l.author == ENV['ACCOUNT_USERNAME'] } }

      # Distinguish the link
      call_guarantee { client.distinguish "t3_#{link.id}" } if options[:distinguish]
    end

    private

    def contents(filename)
      file = File.open filename, 'rb'
      contents = file.read
      file.close
      contents
    end

    def call_guarantee
      return nil unless block_given?
      loop do
        begin
          return yield
        rescue
          # Reddit wasn't available, try again in a few seconds.
          sleep 5
        end
      end
    end
  end
end
