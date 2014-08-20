module TulOhist

  module Datastreams
  
    class DisplayDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.weight index_as: :displayable #Defining order of display for collection objects on Oral History page
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

