module TulHydra::Models
  module Cdm
    extend ActiveSupport::Concern

    included do
     has_metadata name: "contentdmMetadata", label: "CDM metadata", type: TulHydra::Datastreams::ContentdmDatastream   
     has_metadata name: "objectMetadata", label: "Object metadata", type: TulHydra::Datastreams::ObjectDatastream
    end

    

  end
end

