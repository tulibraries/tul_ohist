describe "IdDatastream" do

  before do
    @datastream = TulOhist::Datastreams::idDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="idMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="idMetadata.0" LABEL="ID metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <doi>doi:00.00.00:temple0000</doi>
        <permanent_url>http://sample.com/pid</permanent_url>
        <prefix>mainOralHistoryPrefix</prefix>
        <secondary_prefix>relationshipWithinOralHistoryPrefix</secondary_prefix>
        <accompanies>Another Oral History Collection</accompanies>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term doi" do
    expect(@datastream).to have_term(:doi)
  end

  it "should have term permanent_url" do
    expect(@datastream).to have_term(:permanent_url)
  end

  it "should have term prefix" do
    expect(@datastream).to have_term(:prefix)
  end

  it "should have term secondary_prefix" do
    expect(@datastream).to have_term(:secondary_prefix)
  end

  it "should have term accompanies" do
    expect(@datastream).to have_term(:accompanies)
  end

end
