module TulHydra::Models
  module Object
    extend ActiveSupport::Concern

    included do
     has_metadata name: "objectMetadata", label: "Object metadata", type: TulHydra::Datastreams::ObjectDatastream                   
     has_metadata name: "contentdmMetadata", label: "ContentDM generated metadata", type: TulHydra::Datastreams::ContentdmDatastream                   
    end

    

  end
end

