require "batteries/tasks/notes"
require "batteries/tasks/migrations"

module Batteries
  module Tasks
    module_function

    def new
      Notes.new
      Migrations.new
    end
  end
end
