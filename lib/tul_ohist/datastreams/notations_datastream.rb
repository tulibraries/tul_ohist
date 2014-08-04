module TulOhist

  module Datastreams
  
    class NotationsDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.notes index_as: :stored_searchable
        t.Personal_Names index_as: :stored_searchable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end
