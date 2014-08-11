class Transcript < TulOhist::Models::Base
	has_metadata "base", label: "Base metadata", type: TulOhist::Datastreams::BaseDatastream
	has_metadata "interview_content", label: "Interview content metadata", type: TulOhist::Datastreams::InterviewContentDatastream
	has_metadata "digital", label: "Digital metadata", type: TulOhist::Datastreams::DigitalDatastream
end
