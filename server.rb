#!/usr/bin/env ruby

# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Sample gRPC server that implements the Greeter::Helloworld service.
#
# Usage: $ path/to/greeter_server.rb

lib_dir = File.join(__dir__, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'rubygems'
require 'bundler/setup'
require 'logger'
Bundler.require(:default)

require_relative 'lib/my_service/server'

module RubyLogger
  def logger
    Logger.new('/proc/1/fd/1')
  end
end

# GRPC is the general RPC module
module GRPC
  # Inject the noop #logger if no module-level logger method has been injected.
  extend RubyLogger
end

$stdout.reopen("/dev/null", "w")
$stderr.reopen("/dev/null", "w")

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
      @server.handle(MyService::Server)
      @server.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])

      Logger.new('/proc/1/fd/1').info "gRPC server started on #{address}, ready to accept connections"
    end

    def address
      [HOST, PORT].join(':')
    end
  end
end

Server.start
