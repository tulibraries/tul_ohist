module TulOhist

  module Datastreams
  
    class RelatedItemsDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.repository_collection index_as: :stored_searchable
        t.finding_aid index_as: :displayable
        t.online_exhibit index_as: :displayable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end

