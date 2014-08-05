module MetadataMatchers
  RSpec::Matchers.define :have_datastream_of_type do |name, datastreamClass|
    match do |target|
      target.datastreams.has_key?(name) &&
        target.datastreams[name].class == datastreamClass 
    end
  end
end
