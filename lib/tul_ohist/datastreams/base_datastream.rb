module TulOhist

  module Datastreams
  
    class BaseDatastream < ActiveFedora::OmDatastream

      set_terminology do |t|
        t.root(path: "fields")
        t.title index_as: :stored_searchable
        t.date index_as: :stored_searchable
        t.contact index_as: :stored_searchable
        t.digital_publisher index_as: :stored_searchable
        t.repository index_as: :stored_searchable #location of building/organization ie, SCRC
        t.format index_as: :stored_searchable
        t.format index_as: :stored_searchable
        t.type index_as: :stored_searchable
        t.language index_as: :stored_searchable
        t.subject index_as: :stored_searchable
        t.digital_collection index_as: :stored_searchable #name of collection "bucket" ie Philadelphia Transit Strike
      end 

      def self.xml_template
        Nokogiri::XML.parse("<fields/>")
      end
    
    end

  end
end

