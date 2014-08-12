module TulHydra::Models
  class Base < ActiveFedora::Base
    has_metadata name: "contentdm", label: "CDM metadata", type: TulOhist::Datastreams::ContentdmDatastream
    has_metadata name: "base", label: "Base metadata", type: TulOhist::Datastreams::BaseDatastream
    has_metadata name: "geographic", label: "Geographic metadata", type: TulOhist::Datastreams::GeographicDatastream
    has_metadata name: "notations", label: "Notation metadata", type: TulOhist::Datastreams::NotationsDatastream
    has_metadata name: "physical", label: "Physical metadata", type: TulOhist::Datastreams::PhysicalDatastream
    has_metadata name: "rights", label: "Rights metadata",  type: TulOhist::Datastreams::RightsDatastream
    has_metadata name: "related_items", label: "Related items metadata", type: TulOhist::Datastreams::RelatedItemsDatastream
    has_metadata name: "id", label: "ID metadata", type: TulOhist::Datastreams::IdDatastream
    has_metadata name: "creation", label: "Creation metadata", type: TulOhist::Datastreams::CreationDatastream
end
