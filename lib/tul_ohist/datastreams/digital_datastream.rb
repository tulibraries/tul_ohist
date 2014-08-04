module TulOhist

  module Datastreams
  
    class DigitalDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.file_name index_as: :stored_searchable
        t.documentContent index_as: :stored_searchable
        t.digitizationSpecifications index_as: :stored_searchable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end

