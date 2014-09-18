describe "ContentdmDatastream" do

  subject do
    datastream = TulOhist::Datastreams::ContentdmDatastream.new
    datastream.content = <<EODS
<foxml:datastream ID="contentdmMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="contentdmMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
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
    datastream
  end

  it { is_expected.to have_term(:oclc_number) }
  it { is_expected.to have_term(:date_created) }
  it { is_expected.to have_term(:date_modified) }
  it { is_expected.to have_term(:contentdm_number) }
  it { is_expected.to have_term(:contentdm_file_name) }
  it { is_expected.to have_term(:contentdm_file_path) }
  it { is_expected.to have_term(:contentdm_collection_id) }

end
