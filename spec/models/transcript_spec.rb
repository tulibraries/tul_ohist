describe 'Transcript' do
  subject { Transcript.new }

  it { is_expected.to have_datastream_of_type("base", TulOhist::Datastreams::BaseDatastream) }
  it { is_expected.to have_datastream_of_type("interview_content", TulOhist::Datastreams::InterviewContentDatastream) }
  it { is_expected.to have_datastream_of_type("digital", TulOhist::Datastreams::DigitalDatastream) }
end