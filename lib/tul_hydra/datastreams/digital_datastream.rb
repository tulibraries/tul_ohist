module TulHydra::Datastreams
  
  class DigitalDatastream < ActiveFedora::OmDatastream

    set_terminology do |t|
      t.root(path: "fields")
      t.file_name index_as: :displayable
      t.document_content(:index_as=>[:displayable, :stored_searchable], :type=>:string) 
    
    end

    def self.xml_template
      Nokogiri::XML.parse("<fields/>")
    end
  
  end

end