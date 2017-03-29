# frozen_string_literal: true
require "rake"
require "rake/tasklib"

module Batteries
  module Tasks
    class Secret < ::Rake::TaskLib
      attr_accessor :name, :description, :secret_file, :generator

      def initialize(name = :secret)
        @name = name
        @secret_file = ".session_secret"
        @description = "Generate a session secret in #{secret_file}"
        @generator = method(:default_generator)

        yield self if block_given?

        define
      end

      def define
        desc description
        task name do
          default_generator.call if default_generator.respond_to?(:call)
        end
      end

      def default_generator
        require "securerandom"
        File.write(secret_file, SecureRandom.random_bytes(40))
      end
    end
  end
end
