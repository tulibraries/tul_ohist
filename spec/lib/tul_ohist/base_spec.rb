module MetadataMatchers
  RSpec::Matchers.define :have_datastream_with_type do |name, datastreamClass|
    match do |target|
      target.datastreams.has_key?(name) &&
        target.datastreams[name].class == datastreamClass 
    end
  end

end

describe 'Base' do
  subject { TulOhist::Base.new }

  it "should have metadata ContentDM Datastream" do
    expect(subject).to have_datastream_with_type("contentdm", TulOhist::Datastreams::ContentdmDatastream)
  end

end
