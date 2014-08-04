module TulHydra::Datastreams
  
  class CreationDatastream < ActiveFedora::OmDatastream

    set_terminology do |t|
      t.root(path: "fields")
      t.created #digitizer
      t.creator(:index_as=>[:sortable, :stored_searchable], :type=>:string) #original creator
    
    end

    def self.xml_template
      Nokogiri::XML.parse("<fields/>")
    end
  
  end

end