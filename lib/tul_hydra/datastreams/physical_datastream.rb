module TulHydra::Datastreams
  
  class PhysicalDatastream < ActiveFedora::OmDatastream

    set_terminology do |t|
      t.root(path: "fields")
      t.folder index_as: :stored_searchable
      t.location index_as: :stored_searchable
      t.physical_description(:index_as=>[:displayable, :stored_searchable], :type=>:string) 
    
    end

    def self.xml_template
      Nokogiri::XML.parse("<fields/>")
    end
  
  end

end
