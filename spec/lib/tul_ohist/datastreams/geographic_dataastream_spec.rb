describe "GeographicDatastream" do

  subject do
    datastream = TulOhist::Datastreams::GeographicDatastream.new
    datastream.content = <<EODS
<foxml:datastream ID="geographicMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="geographicMetadata.0" LABEL="geographic metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <geographic_subject>Philadelphia (Pa.)</geographic_subject>
        <organization_building>National Association for the Advancement of Colored People</organization_building>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
    datastream
  end

  it { is_expected.to have_term(:geographic_subject) }
  it { is_expected.to have_term(:organization_building) }

end
