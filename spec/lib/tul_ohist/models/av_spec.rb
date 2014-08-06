describe 'Av' do
  subject { TulOhist::Models::Av.new }

  it { is_expected.to have_datastream_of_type("base", TulOhist::Datastreams::BaseDatastream) }
end