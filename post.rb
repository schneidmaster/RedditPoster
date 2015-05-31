require './bot.rb'

Bot.post!(ARGV[0], ARGV[1], { append_date: ARGV[2], distinguish: ARGV[3] })