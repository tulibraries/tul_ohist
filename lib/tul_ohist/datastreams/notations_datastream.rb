module TulOhist

  module Datastreams
  
    class NotationsDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.notes index_as: :stored_searchable
        t.personal_names(:index_as=>[:facetable, :stored_searchable], :type=>:string) 
        t.biographical_history_note index_as: :stored_searchable
        t.content_summary index_as: :stored_searchable
        t.collection_description index_as: :stored_searchable
        t.ada_note index_as: :stored_searchable
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
