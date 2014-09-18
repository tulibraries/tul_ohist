describe "InterviewContentDatastream" do

  subject do
    datastream = TulOhist::Datastreams::InterviewContentDatastream.new
    datastream.content = <<EODS
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
    datastream
  end

  it { is_expected.to have_term(:transcript) }
  it { is_expected.to have_term(:document_content) }
  it { is_expected.to have_term(:narrator) }
  it { is_expected.to have_term(:interviewer) }
  it { is_expected.to have_term(:ocr_note) }

end
