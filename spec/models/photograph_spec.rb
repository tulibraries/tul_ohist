describe 'Photograph' do

  #TODO: Failing - needs to be updated
  context 'Photograph Class' do
    subject { Photograph.new }

    it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::BaseDatastream) }
    it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::DigitalDatastream) }
  end

  context 'Photograph Object' do
    subject (:compound_object_controller) { CompoundObjectsController.new }

    let (:p) { FactoryGirl.build(:photograph) }
    let (:photograph) { Photograph.create(master_identifier: p.master_identifier, title: p.title, type: p.type) }

    before do
      photograph.update_index
    end

    it "should find the photograph" do
      object = ActiveFedora::Base.where(master_identifier_ssim: p.master_identifier).to_a 
      expect(object.first.master_identifier).to match_array(p.master_identifier)
    end
  end

end
