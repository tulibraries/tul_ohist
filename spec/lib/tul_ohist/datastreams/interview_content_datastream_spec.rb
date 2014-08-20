describe "InterviewContentDatastream" do

  before do
    @datastream = TulOhist::Datastreams::InterviewContentDatastream.new
    @datastream.content = <<EODS
<foxml:datastream ID="interviewContentMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
  <foxml:datastreamVersion ID="interviewContentMetadata.0" LABEL="interview content metadata" MIMETYPE="text/xml">
    <foxml:xmlContent>
      <fields>
        <transcript>Text of supplied transcript</transcript>
        <document_content>OCR text from document</document_content>
        <narrator>Bernyce DeVaughn</narrator>
        <interviewer>John Smith</interviewer>
        <ocr_note>This text is machine-generated. Contact us for a good copy.</ocr_note>
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

  it "should have term narrator" do
    expect(@datastream).to have_term(:narrator)
  end

  it "should have term interviewer" do
    expect(@datastream).to have_term(:interviewer)
  end

  it "should have term ocr_note" do
    expect(@datastream).to have_term(:ocr_note)
  end

end