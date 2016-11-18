require 'sinatra'
require 'sinatra/reloader'
# We're going to need to require our class files
require_relative('lib/task.rb')
require_relative('lib/todo.rb')

todo_list = Todo.new("David")
task1 = Task.new("Task1")
task2 = Task.new("Task2")
task3 = Task.new("Task2")
todo_list.add_task(task1)
todo_list.add_task(task2)
todo_list.add_task(task3)

enable :sessions
get "/tasks" do
  @tasks = todo_list.tasks
  erb(:task_index)
end
get "/new-task" do
  erb(:new_task)
end
post "/create_task" do
  content = params[:content]
  new_task = Task.new(content)
  todo_list.add_task(new_task)
  redirect to ("/tasks")
end
get "/complete_task/:id" do
    id = params[:id]
    new_task= todo_list.find_task id.to_i
    new_task.complete!
    redirect to ("/tasks")
end
get "/delete_task/:id" do
    id = params[:id]
    binding.pry
    todo_list.delete id
    redirect to ("/tasks")
end
