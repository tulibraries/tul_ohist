describe "BaseDatastream" do

  before do
    @datastream = TulOhist::Datastreams::BaseDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="baseMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="baseMetadata.0" LABEL="Base metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <title>Alphonso Deal</title>
        <date>1954-07-17</date>
        <contact>scrc@temple.edu</contact>
        <digital_publisher>Philadelphia PA: Temple University Libraries</digital_publisher>
        <repository>Temple University Libraries, Urban Archives</repository>
        <format>image/jp2</format>
        <type>photograph</type>
        <language>English</language>
        <subject>Schools</subject>
        <subject>Segregation</subject>
        <subject>Demonstrations</subject>
        <subject>Civil rights</subject>
        <digital_collection>John W. Mosley Photographs</digital_collection>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term title" do
    expect(@datastream).to have_term(:title)
  end

  it "should have term date" do
    expect(@datastream).to have_term(:date)
  end

  it "should have term contact" do
    expect(@datastream).to have_term(:contact)
  end

  it "should have term digital_publisher" do
    expect(@datastream).to have_term(:digital_publisher)
  end

  it "should have term repository" do
    expect(@datastream).to have_term(:repository)
  end

  it "should have term format" do
    expect(@datastream).to have_term(:format)
  end

  it "should have term type" do
    expect(@datastream).to have_term(:type)
  end

  it "should have term language" do
    expect(@datastream).to have_term(:language)
  end

  it "should have term subject" do
    expect(@datastream).to have_term(:subject)
  end

  it "should have term digital_collection" do
    expect(@datastream).to have_term(:digital_collection)
  end

end
