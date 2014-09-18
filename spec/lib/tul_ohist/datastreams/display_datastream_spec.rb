describe "DisplayDatastream" do

  subject do
    datastream = TulOhist::Datastreams::DisplayDatastream.new
    datastream.content = <<EODS
<foxml:datastream ID="displayMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="displayMetadata.0" LABEL="Display metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <weight>-10</weight>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
    datastream
  end

  it { is_expected.to have_term(:weight) }

end
