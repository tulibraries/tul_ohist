describe "RightsDatastream" do
  before do
    @datastream = TulOhist::Datastreams::RightsDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="rightsMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="rightsMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <rights>This material is subject to copyright law and is made available for private study, scholarship, and research purposes only. For access to the original or a high resolution reproduction, and for permission to publish, please contact Temple University Libraries, Special Collections Research Center, scrc@temple.edu, 215-204-8257.</rights>
        <click_through>yes</click_through>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term rights" do
    expect(@datastream).to have_term(:rights)
  end

  it "should have term click_through" do
    expect(@datastream).to have_term(:click_through)
  end

end
