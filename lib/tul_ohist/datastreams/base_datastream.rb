module TulOhist

  module Datastreams
  
    class BaseDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.title index_as: :stored_searchable
        t.date index_as: :stored_searchable
        t.contact index_as: :displayable
        t.repository(:index_as=>[:facetable, :stored_searchable], :type=>:string) #location of building/organization ie, SCRC
        t.format(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
        t.type(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
        t.language(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
        t.subject(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) 
        t.digital_collection(:index_as=>[:facetable, :sortable, :stored_searchable], :type=>:string) #name of collection "bucket" ie Philadelphia Transit Strike
        t.doi index_as: :stored_searchable
        t.permanent_url index_as: :displayable
        t.master_identifier index_as: :symbol
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

