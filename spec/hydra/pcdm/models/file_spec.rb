require 'spec_helper'

describe Hydra::PCDM::File do

  let(:file) { Hydra::PCDM::File.new }
  let(:reloaded) { Hydra::PCDM::File.new(file.uri) }

  describe "when saving" do
    it "sets an RDF type" do
      file.content = 'stuff'
      expect(file.save).to be true
      expect(reloaded.metadata_node.query(predicate: RDF.type, object: RDFVocabularies::PCDMTerms.File).map(&:object)).to eq [RDFVocabularies::PCDMTerms.File]
    end
  end

  describe "#label" do
    it "saves a label" do
      file.content = 'stuff'
      file.label = 'foo'
      expect(file.label).to eq ['foo']
      expect(file.save).to be true
      expect(reloaded.label).to eq ['foo']
    end
  end

  context "when implementing pcdm.File in another class" do
    let(:container) { Kontainer.create }
    before do
      class MyFile < Hydra::PCDM::File
      end
      class Kontainer < Hydra::PCDM::Object
        directly_contains :files, has_member_relation: ::RDF::URI("http://pcdm.org/hasFile"), class_name: "MyFile"
      end
      file = container.files.build 
      container.files = [file]
      container.save
    end
    after do
      Object.send(:remove_const, :MyFile)
      Object.send(:remove_const, :Kontainer)
    end
    subject { container.files.first.metadata_node.type }
    it { is_expected.to include(RDFVocabularies::PCDMTerms.File)}
  end

end
