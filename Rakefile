require './bot.rb'

namespace :rp do
  task :post do |_task, args|
    title = args.extras[0]
    name = args.extras[1]
    append = args.extras[2]
    distinguish = args.extras[3]
    Bot.post!(title, name, append_date: append, distinguish: distinguish)
  end
end
