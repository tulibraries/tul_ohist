module TulOhist

  module Datastreams
  
    class PhysicalDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.location index_as: :stored_searchable
        t.physical_description(:index_as=>[:facetable, :stored_searchable], :type=>:string) 
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
