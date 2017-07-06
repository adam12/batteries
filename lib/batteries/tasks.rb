require "batteries/tasks/notes"
require "batteries/tasks/migrations"
require "batteries/tasks/secret"

module Batteries
  module Tasks
    module_function

    def new(tasks: default_tasks)
      tasks.each do |task|
        const_get(task.to_s.capitalize).new
      end
    end

    def default_tasks
      %i(notes migrations secret)
    end
  end
end
