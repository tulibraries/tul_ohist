describe "DisplayDatastream" do

  before do
    @datastream = TulOhist::Datastreams::DisplayDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="displayMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="displayMetadata.0" LABEL="Display metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <weight>-10</weight>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term weight" do
    expect(@datastream).to have_term(:weight)
  end

end
