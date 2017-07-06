# frozen_string_literal: true
require "rake"
require "rake/tasklib"
require "logger"

module Batteries
  module Tasks
    class Migrations < ::Rake::TaskLib
      attr_accessor :migrations_path, :database, :logger

      def initialize
        @migrations_path = "migrate"
        @database = DB if defined?(DB)
        @logger = Logger.new($stdout)

        yield self if block_given?

        define
      end

      def define
        desc "Migrate test database to latest version"
        task :test_up do
          migrate("test", nil)
        end

        desc "Migrate test database all the way down"
        task :test_down do
          migrate("test", 0)
        end

        desc "Migrate test database all the way down and then back up"
        task :test_bounce do
          migrate("test", 0)
          migrate("test", nil)
        end

        desc "Migrate development database to latest version"
        task :dev_up, [:version] do |_t, args|
          version = args[:version]
          version = version ? version.to_i : nil

          migrate("development", version)
        end

        desc "Migrate development database to all the way down"
        task :dev_down, [:version] do |_t, args|
          version = args[:version].to_i

          migrate("development", version)
        end

        desc "Migrate development database all the way down and then back up"
        task :dev_bounce do
          migrate("development", 0)
          migrate("development", nil)
        end

        desc "Migrate production database to latest version"
        task :prod_up do
          migrate("production", nil)
        end
      end

      def migrate(env, version)
        Sequel.extension :migration
        database.loggers << logger if logger
        Sequel::Migrator.apply(database, migrations_path, version)
      end
    end
  end
end
