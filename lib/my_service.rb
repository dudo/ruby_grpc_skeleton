# frozen_string_literal: true

lib_dir = File.expand_path(__dir__)
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

# require_relative './my_service/entities/foo'
# require_relative './my_service/repositories/foo_repository'

require_relative './my_service_pb'
require_relative './my_service_services_pb'
require_relative './my_service/server'

module MyService
end
