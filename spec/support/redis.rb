RSpec.configure do |config|
  config.before(:each) do |example|
    if example.metadata[:redis]
      Redis.new(db: ENV['I18N_TRANSLATION_DASHBOARD_REDIS_DB'] || 1).flushdb
    end
  end
end
