set :output, { error: 'error.log', standard: 'cron.log' }

every 1.day do
  runner "Post.daily_archive"
end