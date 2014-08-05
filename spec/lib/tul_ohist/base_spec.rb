describe 'Base' do
  subject { TulOhist::Base.new }

  it { is_expected.to have_datastream_of_type("contentdm", TulOhist::Datastreams::ContentdmDatastream) }
  it { is_expected.to have_datastream_of_type("base", TulOhist::Datastreams::BaseDatastream) }
  it { is_expected.to have_datastream_of_type("geographic", TulOhist::Datastreams::GeographicDatastream) }
  it { is_expected.to have_datastream_of_type("notations", TulOhist::Datastreams::NotationsDatastream) }
  it { is_expected.to have_datastream_of_type("physical", TulOhist::Datastreams::PhysicalDatastream) }
  it { is_expected.to have_datastream_of_type("rights", TulOhist::Datastreams::RightsDatastream) }
  it { is_expected.to have_datastream_of_type("creation", TulOhist::Datastreams::CreationDatastream) }
end
