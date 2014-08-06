module TulOhist

  module Datastreams
  
    class CreationDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.created index_as: :stored_searchable #digitizer
        t.condition_note index_as: :stored_searchable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end

