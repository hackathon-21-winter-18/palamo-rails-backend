# Rails.application.config.session_store :cookie_store, expire_after: 14.days
# これdbに保存されてんの？だとしたらdbつくられてないから無理では
Rails.application.config.middleware.insert_after ActiveRecord::Migration::CheckPending, ActionDispatch::Cookies
Rails.application.config.middleware.insert_after ActionDispatch::Cookies, ActionDispatch::Session::RedisStore,
  servers: ["redis://#{ENV.fetch("REDIS_HOST") { "redis" }}:6379/0"],
  expire_after: 5.minutes,
  key: "_redis_sample_session" 