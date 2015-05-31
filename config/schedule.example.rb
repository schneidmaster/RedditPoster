# Examples of post schedules you can configure
# See the whenever docs for more: https://github.com/javan/whenever

# Post on some day of the week.
every :saturday, at: '12pm' do
  runner "Bot.post!('Saturday Thread', 'saturday')"
end

# Post every day, also distinguish and append date.
every :saturday, at: '12pm' do
  runner "Bot.post!('Daily Thread', 'daily', { append_date: true, distinguish: true })"
end