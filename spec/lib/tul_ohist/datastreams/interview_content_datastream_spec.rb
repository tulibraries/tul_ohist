describe "InterviewContentDatastream" do

  before do
    @datastream = TulOhist::Datastreams::InterviewContentDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="interviewContentMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="interviewContentMetadata.0" LABEL="interview content metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <transcript>Text of supplied transcript</transcript>
        <document_content>Text from document</document_content>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS
  end

  it "should have term transcript" do
    expect(@datastream).to have_term(:transcript)
  end

  it "should have term document_content" do
    expect(@datastream).to have_term(:document_content)
  end

end
