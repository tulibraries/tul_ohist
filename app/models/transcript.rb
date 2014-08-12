class Transcript < TulOhist::Models::Base
	has_metadata "base", label: "Base metadata", type: TulOhist::Datastreams::BaseDatastream
	has_metadata "interview_content", label: "Interview content metadata", type: TulOhist::Datastreams::InterviewContentDatastream
	has_metadata "digital", label: "Digital metadata", type: TulOhist::Datastreams::DigitalDatastream
       
  has_attributes :title, datastream: 'objectMetadata', multiple: false
  
  has_attributes :oclc_number, :date_created, :date_modified, :contentdm_number, 
   :contentdm_file_name, :contentdm_file_path, :contentdm_collection_id, datastream: 'contentdmMetadata', multiple: false
  
  has_attributes :notes, :narrator, datastream: 'descMetadata', multiple: true


  end
end
