module TulOhist

  module Datastreams
  
    class InterviewContentDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.transcript index_as: :displayable
        t.document_content index_as: :displayable
        t.narrator index_as: :displayable
        t.interviewer index_as: :displayable
        t.ocr_note index_as: :displayable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end

