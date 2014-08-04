module TulHydra::Datastreams
  
  class ObjectDatastream < ActiveFedora::OmDatastream

    set_terminology do |t|
      t.root(path: "fields")
      t.title(:index_as=>[:sortable, :stored_searchable], :type=>:string) 
      t.date(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
      t.subject(:index_as=>[:facetable, :stored_searchable], :type=>:string) 
      t.description index_as: :stored_searchable
      t.format(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
      t.type(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
      t.publisher(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
      t.digital_collection(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
      t.digital_publisher(:index_as=>[:sortable, :stored_searchable], :type=>:string) 
      t.digital_specifications
      t.contact index_as: :displayable
      t.repository(:index_as=>[:facetable, :stored_searchable], :type=>:string) 
      t.repository_collection index_as: :stored_searchable
      t.language index_as: :facetable
      t.identifier(:index_as=>[:displayable, :sortable, :stored_searchable], :type=>:string) 
      
    
    end

    def self.xml_template
      Nokogiri::XML.parse("<fields/>")
    end
  
  end

end
