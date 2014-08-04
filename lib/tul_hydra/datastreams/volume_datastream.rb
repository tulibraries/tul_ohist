module TulHydra::Datastreams
  
  class VolumeDatastream < ActiveFedora::OmDatastream

    set_terminology do |t|
      t.root(path: "fields")
      t.local_call_number(:index_as=>[:sortable, :stored_searchable], :type=>:string) 
      t.number_of_pages index_as: :displayable
    
    end

    def self.xml_template
      Nokogiri::XML.parse("<fields/>")
    end
  
  end

end