require "batteries/tasks/notes"

module Batteries
  module Tasks
    module_function

    def new
      Notes.new
    end
  end
end
