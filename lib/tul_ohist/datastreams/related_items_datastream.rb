module TulOhist

  module Datastreams
  
    class RelatedItemsDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.repository_collection index_as: :stored_searchable
        t.finding_aid_link index_as: :displayable
        t.finding_aid_title index_as: :displayable
        t.online_exhibit_link index_as: :displayable
        t.online_exhibit_title index_as: :displayable
        t.catalog_record_link index_as: :displayable
        t.catalog_record_title index_as: :displayable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end

      def prefix
        ""
      end
    
    end

  end
end

