module TulOhist

  module Datastreams
  
    class GeographicDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.geographic_subject index_as: :stored_searchable
        t.organization_building index_as: :stored_searchable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end
