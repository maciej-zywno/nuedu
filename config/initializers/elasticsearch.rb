# Print Curl-formatted traces in development
#
# if Rails.env.development?
#   tracer = ActiveSupport::Logger.new(STDERR)
#   tracer.level =  Logger::INFO
# end

# Elasticsearch::Model.client = Elasticsearch::Client.new( tracer: tracer, host: ENV['ELASTICSEARCH_URL'])