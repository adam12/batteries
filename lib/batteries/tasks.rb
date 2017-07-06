require "ostruct"
require "batteries/tasks/notes"
require "batteries/tasks/migrations"
require "batteries/tasks/secret"

module Batteries
  module Tasks
    module_function

    def new(tasks: default_tasks)
      task_options = setup_task_options(tasks)

      yield task_options if block_given?

      tasks.each do |task|
        const_get(task.to_s.capitalize).new(options: task_options[task].to_h)
      end
    end

    def default_tasks
      %i(notes migrations secret)
    end

    def setup_task_options(tasks)
      tasks.each_with_object(OpenStruct.new) do |task, memo|
        memo.send("#{task}=", OpenStruct.new)
      end
    end
  end
end
