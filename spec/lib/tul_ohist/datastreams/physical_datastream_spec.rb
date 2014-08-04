describe "PhysicalDatastream" do
  before do
    @datastream = TulOhist::Datastreams::PhysicalDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="physicalMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="physicalMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <folder>PC-75-10--N.A.A.C.P--Milton Montgomery</folder>
        <physical_description>1 photograph:b&amp;w</physical_description>
        <location>SCRC</location>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term folder" do
    expect(@datastream).to have_term(:folder)
  end

  it "should have term physical_description" do
    expect(@datastream).to have_term(:physical_description)
  end

  it "should have term location" do
    expect(@datastream).to have_term(:location)
  end

end
