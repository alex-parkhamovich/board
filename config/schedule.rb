set :output, { error: 'error.log', standard: 'cron.log' }

every 2.minutes do
  runner "Post.arch"
end