module TulOhist

  module Datastreams
  
    class InterviewContentDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.transcript index_as: :stored_searchable
        t.document_content index_as: :displayable
        t.narrator(:index_as=>[:facetable, :stored_searchable], :type=>:string) 
        t.interviewer index_as: :stored_searchable
        t.ocr_note index_as: :displayable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end

      def prefix
        "#{dsid.underscore}__"
      end
    
    end

  end
end

