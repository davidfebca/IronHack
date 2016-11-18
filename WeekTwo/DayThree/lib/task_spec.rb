require 'rspec'

describe Task do
  before do
    @subject = Task.new("Task1")
  end
  describe "#new" do
    let(:content){"this is the content"}
    it 'saves the content' do
      task = Task.new("this is the content")
      expect(task.content).to eq(content)
    end
  end
  describe '#complete!' do
    let(:expected_output) {true}
    let(:result) { @subject.status}
    it 'complete task' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#complete?' do
    let(:expected_output) {false}
    let(:result) { @subject.status }
    it 'is the task complete??' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#update' do
    let(:input) {"hola"}
    let(:expected_output) {"hola"}
    let(:result) { @subject.update(input))}
    it 'update task by id' do
      expect(result).to eq(expected_output)
    end
  end
end
