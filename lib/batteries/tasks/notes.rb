# frozen_string_literal: true
require "rake"
require "rake/tasklib"

module Batteries
  module Tasks
    class Notes < ::Rake::TaskLib
      attr_accessor :name, :description, :excluded_dirs, :matchers

      def initialize(name = :notes, options: {})
        @name           = options[:name] || name
        @description    = options.fetch(:description)   { "Notes" }
        @excluded_dirs  = options.fetch(:excluded_dirs) { %w(node_modules public) }
        @matchers       = options.fetch(:matchers)      { %w(FIXME TODO) }

        yield self if block_given?

        define
      end

      def define
        desc @description
        task name do
          excludes = @excluded_dirs
                     .map { |dir| "--exclude-dir '#{dir}'" }.join(" ")

          matchers = @matchers.map { |matcher| "-e '#{matcher}'" }.join(" ")

          sh "grep #{excludes} -n -R --color #{matchers} *"
        end

        self
      end
    end
  end
end
