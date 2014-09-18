describe 'Base' do
  subject { TulOhist::Models::Base.new }

  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::ContentdmDatastream) }
  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::BaseDatastream) }
  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::GeographicDatastream) }
  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::NotationsDatastream) }
  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::PhysicalDatastream) }
  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::RightsDatastream) }
  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::RelatedItemsDatastream) }
  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::CreationDatastream) }
  it { is_expected.to have_metadata_stream_of_type(TulOhist::Datastreams::DisplayDatastream) }
end
