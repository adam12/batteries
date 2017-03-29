require "batteries/tasks/notes"
require "batteries/tasks/migrations"
require "batteries/tasks/secret"

module Batteries
  module Tasks
    module_function

    def new
      Notes.new
      Migrations.new
      Secret.new
    end
  end
end
