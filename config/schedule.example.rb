# Examples of post schedules you can configure
# See the whenever docs for more: https://github.com/javan/whenever
#
# Options:
# append_date - determines whether to append the current date to the post title
# distinguish - determines whether to distinguish the post after it's made
#               (you must make your bot a moderator for this to work)

# Leave this line in place for jobs to be correctly generated
job_type :make, 'cd :path && ruby post.rb ":title" :name :append_date :distinguish'

# Post on some day of the week.
every :saturday, at: '12pm' do
  make :post, title: 'Saturday Thread', name: 'saturday', append_date: true, distinguish: true
end

# Post every day of the week
every :day, at: '12pm' do
  make :post, title: 'Daily Thread', name: 'daily', append_date: true, distinguish: true
end
