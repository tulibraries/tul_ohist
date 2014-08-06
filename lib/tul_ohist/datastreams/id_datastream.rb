module TulOhist

  module Datastreams
  
    class IdDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.doi index_as: :stored_searchable
        t.permanent_url index_as: :displayable
        t.master_identifier index_as: :displayable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end

