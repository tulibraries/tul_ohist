describe "BaseDatastream" do

  subject {
    datastream = TulOhist::Datastreams::BaseDatastream.new
    datastream.content = <<EODS
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
        <doi>ABCDE12345</doi>
        <permanent_url>http://example.com/ABCDE12345.jpg</permanent_url>
        <master_identifier>ZYXWV98765</master_identifier>
      </fields>
    </foxml:xmlContent>
  </foxml:datastreamVersion>
</foxml:datastream>
EODS

    datastream
  }

  it { is_expected.to have_term(:title) }
  it { is_expected.to have_term(:date) }
  it { is_expected.to have_term(:contact) }
  it { is_expected.to have_term(:repository) }
  it { is_expected.to have_term(:format) }
  it { is_expected.to have_term(:type) }
  it { is_expected.to have_term(:language) }
  it { is_expected.to have_term(:subject) }
  it { is_expected.to have_term(:digital_collection) }
  it { is_expected.to have_term(:doi) }
  it { is_expected.to have_term(:permanent_url) }
  it { is_expected.to have_term(:master_identifier) }

end
