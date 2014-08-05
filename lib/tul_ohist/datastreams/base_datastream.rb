module TulOhist

  module Datastreams
  
    class BaseDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.item_url index_as: :stored_searchable
        t.title index_as: :stored_searchable
        t.date index_as: :stored_searchable
        t.contact index_as: :stored_searchable
        t.publisher index_as: :stored_searchable
        t.repository index_as: :stored_searchable
        t.format index_as: :stored_searchable
        t.Type index_as: :stored_searchable
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end

