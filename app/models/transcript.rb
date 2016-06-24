class Transcript < TulOhist::Models::Base
  has_metadata "interviewContentMetadata", type: TulOhist::Datastreams::InterviewContentDatastream
  has_metadata "digitalMetadata", type: TulOhist::Datastreams::DigitalDatastream
       
  has_attributes :title, :date, :contact, :digital_publisher, :repository, :format, :type, :language, :subject, :digital_collection, :doi, :permanent_url, :master_identifier, datastream: 'objectMetadata', multiple: true
  has_attributes :oclc_number, :date_created, :date_modified, :contentdm_number, :contentdm_file_name, :contentdm_file_path, :contentdm_collection_id, datastream: 'contentdmMetadata', multiple: false
  has_attributes :created, :condition_note, datastream: 'creationMetadata', multiple: true
  has_attributes :geographic_subject, :organization_building, datastream: 'geographicMetadata', multiple: true
  has_attributes :notes, :personal_names, :biographical_history_note, :content_summary, :collection_description, :ada_note, :transcript_note, datastream: 'notationsMetadata', multiple: true
  has_attributes :location, :physical_description, datastream: 'physicalMetadata', multiple: true
  has_attributes :rights, :click_through, datastream: 'rightsMetadata', multiple: true
  has_attributes :repository_collection, :finding_aid_link, :finding_aid_title, :online_exhibit_link, :online_exhibit_title, :catalog_record_link, :catalog_record_title, datastream: 'relatedResourcesMetadata', multiple: true
  has_attributes :transcript, :document_content, :narrator, :interviewer, :ocr_note, datastream: 'interviewContentMetadata', multiple: true
  has_attributes :digitization_specifications, :original_recording_specifications, :transcript_filename, :audio_filename, :photograph_filename, :ensemble_identifier, datastream: 'digitalMetadata', multiple: true
  has_attributes :weight, datastream: 'displayMetadata', multiple: false


end
