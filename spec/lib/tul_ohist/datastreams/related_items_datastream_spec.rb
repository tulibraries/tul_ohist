describe "RelatedItemsDatastream" do

  subject do
    datastream = TulOhist::Datastreams::RelatedItemsDatastream.new
    datastream.content = <<EODS
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
    datastream
  end

  it { is_expected.to have_term(:repository_collection) }
  it { is_expected.to have_term(:finding_aid_link) }
  it { is_expected.to have_term(:finding_aid_title) }
  it { is_expected.to have_term(:online_exhibit_link) }
  it { is_expected.to have_term(:catalog_record_link) }
  it { is_expected.to have_term(:catalog_record_title) }

end
