describe "PhysicalDatastream" do
  before do
    @datastream = TulOhist::Datastreams::PhysicalDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="physicalMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="physicalMetadata.0" LABEL="physical metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <folder>Box 8, Folder 5</folder>
        <physical_description>1 photograph:b&amp;w</physical_description>
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

end
