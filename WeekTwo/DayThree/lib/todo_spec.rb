require 'rspec'
require './todo'
require './task'
#display our tasks, have the ability to complete / delete tasks, and then update the task to something different.
describe Todo do
  before  do
    @subject = Todo.new("david")
    @task1 = Task.new("Tarea 1")
    @subject.add_task(@task1)
  end
  describe '#add_task' do
    it 'adds a task into tasks'
    task = Task.new('something')
    @subject.add_task task
    expect(subject.tasks).to include(task)
  end
  end
  describe '#display' do
    let(:expected_output) { @subject.tasks}
    let(:result) { @subject.display }
    it 'displays an array of tasks' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#find_task' do
    let(:input) {1}
    let(:expected_output) {@task1}
    let(:result) { @subject.find_task (input) }
    it 'find a class by Id' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#delete' do
    let(:input) {1}
    let(:expected_output) {[]}
    let(:result) { @subject.delete(@task1.id) }
    it 'if task doesnt exist retrun false' do
      expect(result).to eq(expected_output)
    end
  end
end
