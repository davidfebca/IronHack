require 'pry'
require 'yaml/store'
class Todo
  attr_accessor :tasks,:name
  def initialize name
    @name = name
    @tasks = []
    @todo_store = YAML::Store.new("./public/tasks.yml")
  end
  def display
    @tasks
  end
  def add_task task
      @tasks.push(task)
  end
  def find_task id_task
    result = @tasks.find {|task| task.id == id_task}
  end
  def delete id_task
      @tasks.delete_if do |item|
        item.id == id_task.to_i
      end
  end
  def sort
    sorted_tasks = @tasks.sort { | task1, task2 | task1.id <=> task2.id }
  end
  def sort_by_created
    sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
  end
  def save
    @todo_store.transaction do
      @todo_store["tarea"] = @tasks
    end
  end
end
