describe "DigitalDatastream" do

  before do
    @datastream = TulOhist::Datastreams::DigitalDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="digitalMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="digitalMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <file_name>sample.pdf</file_name>
        <documentContent>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</documentContent>
        <digitizationSpecifications>300ppi</digitizationSpecifications>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term file_name" do
    expect(@datastream).to have_term(:file_name)
  end

  it "should have term documentContent" do
    expect(@datastream).to have_term(:documentContent)
  end

  it "should have term digitizationSpecifications" do
    expect(@datastream).to have_term(:digitizationSpecifications)
  end

end
