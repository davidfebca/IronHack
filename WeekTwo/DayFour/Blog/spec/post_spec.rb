require 'rspec'
require '../lib/models/author'
require '../lib/models/category'
require '../lib/models/post'

describe Post do
  subject { described_class.new("New post", "Content post",1,1) }

  describe '#change_status' do
    let(:result){subject.change_status false}
    let(:expected_output){false}
    it 'changes de status of the post' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#update' do
    let(:result){subject.update("Changed","Changed",2,2,true)}
    let(:expected_output){Time.now}
    it 'changes de status of the post' do
      expect(result).to eq(expected_output)
    end
  end
  describe '#get_content' do
    let(:result){subject.get_content}
    let(:expected_output){"Content post"}
    it 'changes de status of the post' do
      expect(result).to eq(expected_output)
    end
  end
end
