# frozen_string_literal: true

namespace :grpc do
  desc 'Call the gRPC server for testing'
  task fetch_something: :environment do
    stub = MyService::Stub.new('my-service:50052', :this_channel_is_insecure)
    resps = stub.fetch_something(SomeQuery.new)

    resps.each do |resp|
      puts resp.thing_uuid
    end
  end
end
