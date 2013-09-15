<<<<<<< HEAD
Discourse::Application.config.secret_token = ENV["SECRET_TOKEN"]
=======
# We have had lots of config issues with SECRET_TOKEN to avoid this mess we are moving it to redis
#  if you feel strongly that it does not belong there use ENV['SECRET_TOKEN']
#
token = ENV['SECRET_TOKEN']
unless token
  token = $redis.get('SECRET_TOKEN')
  unless token && token.length == 128
    token = SecureRandom.hex(64)
    $redis.set('SECRET_TOKEN',token)
  end
end
>>>>>>> 982b763216a6109ab5dd108a3e3851b5f183bea9

Discourse::Application.config.secret_token = token
