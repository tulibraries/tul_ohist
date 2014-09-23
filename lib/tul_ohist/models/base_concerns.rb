module TulOhist::Models
  module BaseConcerns
    extend ActiveSupport::Concern
    included do
      has_metadata name: "contentdmMetadata", label: "CDM metadata", type: TulOhist::Datastreams::ContentdmDatastream
      has_metadata name: "objectMetadata", label: "Base metadata", type: TulOhist::Datastreams::BaseDatastream
      has_metadata name: "geographicMetadata", label: "Geographic metadata", type: TulOhist::Datastreams::GeographicDatastream
      has_metadata name: "notationsMetadata", label: "Notation metadata", type: TulOhist::Datastreams::NotationsDatastream
      has_metadata name: "physicalMetadata", label: "Physical metadata", type: TulOhist::Datastreams::PhysicalDatastream
      has_metadata name: "rightsMetadata", label: "Rights metadata",  type: TulOhist::Datastreams::RightsDatastream
      has_metadata name: "relatedResourcesMetadata", label: "Related resources metadata", type: TulOhist::Datastreams::RelatedResourcesDatastream
      has_metadata name: "creationMetadata", label: "Creation metadata", type: TulOhist::Datastreams::CreationDatastream
      has_metadata name: "displayMetadata", label: "Display metadata", type: TulOhist::Datastreams::DisplayDatastream
    end
  end
end

