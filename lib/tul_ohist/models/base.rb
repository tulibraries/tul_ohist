module TulOhist::Models
  class Base < ActiveFedora::Base
    has_metadata "contentdm", label: "CDM metadata", type: TulOhist::Datastreams::ContentdmDatastream
    has_metadata "base", label: "Base metadata", type: TulOhist::Datastreams::BaseDatastream
    has_metadata "geographic", label: "Geographic metadata", type: TulOhist::Datastreams::GeographicDatastream
    has_metadata "notations", label: "Notation metadata", type: TulOhist::Datastreams::NotationsDatastream
    has_metadata "physical", label: "Physical metadata", type: TulOhist::Datastreams::PhysicalDatastream
    has_metadata "rights", label: "Rights metadata",  type: TulOhist::Datastreams::RightsDatastream
    has_metadata "related_items", label: "Related items metadata", type: TulOhist::Datastreams::RelatedItemsDatastream
    has_metadata "id", label: "ID metadata", type: TulOhist::Datastreams::IdDatastream
    has_metadata "creation", label: "Creation metadata", type: TulOhist::Datastreams::CreationDatastream
  end
end
