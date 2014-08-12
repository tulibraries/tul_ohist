module TulOhist::Models
  class Av < ActiveFedora::Base
    has_metadata name: "base", label: "Base metadata", type: TulOhist::Datastreams::BaseDatastream
  end
end