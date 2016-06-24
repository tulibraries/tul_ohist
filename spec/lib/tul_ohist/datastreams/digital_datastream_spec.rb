describe "DigitalDatastream" do

  let (:datastream_file) do
     File.join(Rails.root, 'spec', 'samples', 'digital_datastream.xml')
  end

  subject do
    datastream = TulOhist::Datastreams::DigitalDatastream.new
    File.open( datastream_file ) do |f|
      datastream.content = f.read
    end
    datastream
  end

  it { is_expected.to have_term(:digitization_specifications) }
  it { is_expected.to have_term(:original_recording_specifications) }
  it { is_expected.to have_term(:transcript_filename) }
  it { is_expected.to have_term(:audio_filename) }
  it { is_expected.to have_term(:photograph_filename) }
  it { is_expected.to have_term(:ensemble_identifier) }

end
