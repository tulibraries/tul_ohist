module TulOhist

  module Datastreams
  
    class CreationDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.created index_as: :displayable #digitizer
        t.condition_note index_as: :displayable
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

