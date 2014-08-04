module TulHydra::Models
  module AudVis
    extend ActiveSupport::Concern

    included do
     has_metadata name: "avMetadata", label: "Audiovisual metadata", type: TulHydra::Datastreams::AvDatastream   
    end

    

  end
end

