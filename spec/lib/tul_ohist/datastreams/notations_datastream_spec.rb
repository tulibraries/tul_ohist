describe "NotationsDatastream" do
  before do
    @datastream = TulOhist::Datastreams::NotationsDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="notationsMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="notationsMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>,
      <fields>
        <notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</notes>
        <Personal_Names></Personal_Names>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term notes" do
    expect(@datastream).to have_term(:notes)
  end

  it "should have term Personal_Names" do
    expect(@datastream).to have_term(:Personal_Names)
  end

end
