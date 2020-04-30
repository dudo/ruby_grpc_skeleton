#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require_relative './config/boot'

class Server
  HOST = '0.0.0.0'.freeze
  PORT = '50052'.freeze

  class << self
    def start
      start_grpc_server
    end

    private

    def start_grpc_server
      # https://www.rubydoc.info/github/grpc/grpc/7131c62/GRPC/RpcServer
      @server = GRPC::RpcServer.new(pool_size: 2)
      @server.add_http2_port(address, :this_port_is_insecure)
      GRPC.logger.info("gRPC server started on #{address}...")
      @server.handle(MyService::Server)
      @server.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
    end

    def address
      [HOST, PORT].join(':')
    end
  end
end

Server.start
