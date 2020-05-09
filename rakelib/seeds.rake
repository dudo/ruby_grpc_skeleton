# frozen_string_literal: true

namespace :seed do
  desc 'Create a room for testing'
  task things: :environment do
    ThingRepository.new.rooms.where(foo: 'asdf').first ||
      ThingRepository.new.create(foo: 'asdf')
  end
end
