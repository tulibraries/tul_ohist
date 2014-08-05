module TulOhist
  class Base < ActiveFedora::Base
    has_metadata "contentdm", type: TulOhist::Datastreams::ContentdmDatastream
    has_metadata "base", type: TulOhist::Datastreams::BaseDatastream
  end
end
