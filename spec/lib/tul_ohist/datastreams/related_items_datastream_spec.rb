describe "RelatedItemsDatastream" do

  before do
    @datastream = TulOhist::Datastreams::RelatedItemsDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="relatedItemsMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="relatedItemsMetadata.0" LABEL="related items metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <repository_collection>John W. Mosley Photograph Collection</repository_collection>
        <finding_aid>http://sample.library.temple.edu/c-rg1-s1-findingaid.html</finding_aid>
        <online_exhibit>http://exhibits.library.temple.edu/sample</online_exhibit>
        <catalog_record>http://catalog.library.temple.edu/sample_record</catalog_record>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term repository_collection" do
    expect(@datastream).to have_term(:repository_collection)
  end

  it "should have term finding_aid" do
    expect(@datastream).to have_term(:finding_aid)
  end

  it "should have term online_exhibit" do
    expect(@datastream).to have_term(:online_exhibit)
  end

  it "should have term catalog_record" do
    expect(@datastream).to have_term(:catalog_record)
  end

end
