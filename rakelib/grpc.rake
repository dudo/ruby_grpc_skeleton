# frozen_string_literal: true

namespace :grpc do
  desc 'Call the gRPC server for testing'
  task fetch_something: :environment do
    stub = MyService::Stub.new(ENV['MY_SERVICE_URL'], :this_channel_is_insecure)
    resps = stub.fetch_something(SomeQuery.new)

    resps.each do |resp|
      puts resp.thing_uuid
    end
  end
end
