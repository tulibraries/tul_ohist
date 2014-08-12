module TulOhist

  module Datastreams
  
    class ContentdmDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.item_url index_as: :displayable
        t.oclc_number index_as: :displayable
        t.date_created index_as: :displayable
        t.date_modified index_as: :displayable
        t.contentdm_number index_as: :displayable
        t.contentdm_file_name index_as: :displayable
        t.contentdm_file_path index_as: :displayable
        t.contentdm_collection_id index_as: :displayable
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

