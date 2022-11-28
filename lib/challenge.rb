# frozen_string_literal: true

require 'securerandom'
require 'tempfile'

require_relative "challenge/version"
require_relative "challenge/dispatcher/controller"

module Challenge
  module_function

  def run(input:)
    with_file(input) do |file|
      puts Application::Dispatcher::Controller
        .new(path: file.path)
        .execute
    end
  end

  def with_file(text)
    hash = SecureRandom.hex(12)
    file = Tempfile.new(hash)
    file.write(text)
    file.close
    yield(file) if block_given?
    file.unlink
  end
end
