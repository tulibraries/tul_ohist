module TulOhist

  module Datastreams
  
    class DigitalDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.digitization_specifications index_as: :displayable
        t.original_recording_specifications index_as: :displayable
        t.transcript_filename index_as: :stored_searchable
        t.audio_filename index_as: :stored_searchable
        t.photograph_filename index_as: :stored_searchable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end

