module TulOhist

  module Datastreams
  
    class RightsDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.rights index_as: :displayable
        t.click_through index_as: :displayable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end
