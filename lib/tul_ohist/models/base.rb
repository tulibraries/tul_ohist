module TulOhist::Models
  class Base < ActiveFedora::Base
    has_metadata "contentdm", type: TulOhist::Datastreams::ContentdmDatastream
    has_metadata "base", type: TulOhist::Datastreams::BaseDatastream
    has_metadata "geographic", type: TulOhist::Datastreams::GeographicDatastream
    has_metadata "notations", type: TulOhist::Datastreams::NotationsDatastream
    has_metadata "physical", type: TulOhist::Datastreams::PhysicalDatastream
    has_metadata "rights", type: TulOhist::Datastreams::RightsDatastream
    has_metadata "related_items", type: TulOhist::Datastreams::RelatedItemsDatastream
    has_metadata "id", type: TulOhist::Datastreams::IdDatastream
    has_metadata "creation", type: TulOhist::Datastreams::CreationDatastream
  end
end
