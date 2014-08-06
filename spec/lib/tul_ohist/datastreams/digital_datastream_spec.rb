describe "DigitalDatastream" do

  before do
    @datastream = TulOhist::Datastreams::DigitalDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="digitalMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="digitalMetadata.0" LABEL="digital metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <digitization_specifications>MPEG 1/2 layer III</digitization_specifications>
        <original_recording_specifications>mode 2, 32 kHz/16 bits, linear</original_recording_specifications>
        <transcript_filename>UA0001.pdf</transcript_filename>
        <audio_filename>UA0001.mp3</audio_filename>
        <photograph_filename>UA0001.tif</photograph_filename>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term digitization_specifications" do
    expect(@datastream).to have_term(:digitization_specifications)
  end

  it "should have term original_recording_specifications" do
    expect(@datastream).to have_term(:original_recording_specifications)
  end

  it "should have term transcript_filename" do
    expect(@datastream).to have_term(:transcript_filename)
  end

  it "should have term audio_filename" do
    expect(@datastream).to have_term(:audio_filename)
  end

  it "should have term photograph_filename" do
    expect(@datastream).to have_term(:photograph_filename)
  end

end