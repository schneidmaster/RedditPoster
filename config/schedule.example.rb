# Examples of post schedules you can configure
# See the whenever docs for more: https://github.com/javan/whenever
#
# Options:
# append_date - determines whether to append the current date to the post title
# distinguish - determines whether to distinguish the post after it's made
#               (you must make your bot a moderator for this to work)

# Post on some day of the week.
every :saturday, at: '12pm' do
  title = 'Saturday Thread'
  name = 'saturday'
  append_date = false
  distinguish = false
  rake "rp:post[\"#{title}\",#{name},#{append_date},#{distinguish}]"
end

# Post every day of the week
every :day, at: '12pm' do
  title = 'Saturday Thread'
  name = 'saturday'
  append_date = false
  distinguish = false
  rake "rp:post[\"#{title}\",#{name},#{append_date},#{distinguish}]"
end
