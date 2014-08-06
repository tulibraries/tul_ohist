class Photograph < TulOhist::Models::Base
	has_metadata "base", label: "Base metadata", type: TulOhist::Datastreams::BaseDatastream
	has_metadata "digital", label: "Digital metadata", type: TulOhist::Datastreams::DigitalDatastream
end
