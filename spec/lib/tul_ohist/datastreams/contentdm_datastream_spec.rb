describe "ContentdmDatastream" do

  before do
    @datastream = TulOhist::Datastreams::ContentdmDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="contentdmMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="contentdmMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <item_url>http://contentdm.example.com/path/to/collection/object</item_url>
        <oclc_number/>
        <date_created>2014-07-30</date_created>
        <date_modified>2014-08-01</date_modified>
        <contentdm_number>1</contentdm_number>
        <contentdm_file_name>object.jp2</contentdm_file_name>
        <contentdm_file_path>/collection/object.jp2</contentdm_file_path>
        <contentdm_collection_id>collection/object</contentdm_collection_id>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term item_url" do
    expect(@datastream).to have_term(:item_url)
  end

  it "should have term oclc_number" do
    expect(@datastream).to have_term(:oclc_number)
  end

  it "should have attribute date_created" do
    expect(@datastream).to have_term(:date_created)
  end

  it "should have term date_modified" do
    expect(@datastream).to have_term(:date_modified)
  end

  it "should have term contentdm_number" do
    expect(@datastream).to have_term(:contentdm_number)
  end

  it "should have term contentdm_file_name" do
    expect(@datastream).to have_term(:contentdm_file_name)
  end

  it "should have term contentdm_file_path" do
    expect(@datastream).to have_term(:contentdm_file_path)
  end

  it "should have term contentdm_collection_id" do
    expect(@datastream).to have_term(:contentdm_collection_id)
  end

end
