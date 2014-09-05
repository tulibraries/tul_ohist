module ObjectsMetadataMatchers
  RSpec::Matchers.define :have_object_of_type do |attributeType|
    match do |target|
      target.find { |object| object.type.include? attributeType }
    end
  end
end
