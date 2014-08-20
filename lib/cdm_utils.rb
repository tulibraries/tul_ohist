require "active-fedora"
require "open-uri"
require "fileutils"

module CDMUtils
  def self.list(server)
    cdm_url = "#{server}/dmwebservices/index.php?q=dmGetCollectionList/xml"
    xml = Nokogiri::XML(open(cdm_url))
    all_aliases = xml.xpath("/collections/collection/alias/text()")
  end

  private
  def download_one_collection(config, coll)
    Download.init_download
    Download.download(config, coll)
  end
  module_function :download_one_collection # :nodoc:

  def download_all_collections(config)
    Download.init_download
    Download.download(config)
  end
  module_function :download_all_collections # :nodoc:

  class Download
    def self.init_download
      OpenURI::Buffer.send :remove_const, 'StringMax'
      OpenURI::Buffer.const_set 'StringMax', 0
    end

    def self.download(config, coll=nil)
      # coll is the collection to import
      # If coll is nil, then import all the available collections
      user = config['cdm_user']
      password = config['cdm_password']
      cdm_url = "#{config['cdm_server']}/dmwebservices/index.php?q=dmGetCollectionList/xml"
      xml = Nokogiri::XML(open(cdm_url))
      FileUtils::mkdir_p config['cdm_download_dir']
      all_aliases = xml.xpath("/collections/collection/alias/text()")
      harvested_count = 0
      all_aliases.length.times do |i|
        new_coll = all_aliases[i].to_s
        if coll.nil? or new_coll.include?(coll)
          dl_url = config['cdm_server']+"/cgi-bin/admin/getfile.exe?CISOMODE=1&CISOFILE="+new_coll+"/index/description/export.xml"
          xmlFilePath = "#{config['cdm_download_dir']}" + new_coll + ".xml"
          puts "xmlFilePath #{xmlFilePath}"
          source_url = open(dl_url, :http_basic_authentication=>[user, password])
          file = File.read source_url
          File.open(Rails.root + xmlFilePath, 'w') { |f| f.write(file) }	
          puts "Successfully harvested #{new_coll}"
          harvested_count += 1
        end
      end 
      harvested_count
    end
  end

  def conform(doc, collection_file_name, target_dir)
    Convert.conform(doc, collection_file_name, target_dir)
  end
  module_function :conform # :nodoc:

  def convert_file(file_name, foxml_dir)
    Convert.convert_file(file_name, foxml_dir)
  end
  module_function :convert_file # :nodoc:

  class Convert
    def self.conform(doc, collection_file_name, target_dir)
      
      #Strip out any bad keying from CDM
      replace = doc.gsub("&amp<", "<")
      replace2 = replace.gsub("&quot<", "<")
      replace3 = replace2.gsub("", "")
      
      #Normalize inconsistent CDM metadata vocabulary
      #So ugly -- remove when vocab is normalized by staff
      replace4 = replace3.gsub("<Filename>", "<File_Name>")
      replace5 = replace4.gsub("<Created_by>", "<Created>")
      replace6 = replace5.gsub("<Personal_Name>", "<Personal_Names>")
      replace7 = replace6.gsub("<Organization>", "<Organization_Building>")
      replace8 = replace7.gsub("<Organization-Building>", "<Organization_Building>")
      replace9 = replace8.gsub("<Note>", "<Notes>")
      replace10 = replace9.gsub("<Title_Alternative>", "<Alternate_Title>")
      replace11 = replace10.gsub("<Call_Number>", "<Local_Call_Number>")
      replace12 = replace11.gsub("<Audio_Filename>", "<File_Name>")
      replace13 = replace12.gsub("<Video_Filename>", "<File_Name>")
      
      replace14 = replace13.gsub("</Filename>", "</File_Name>")
      replace15 = replace14.gsub("</Created_by>", "</Created>")
      replace16 = replace15.gsub("</Personal_Name>", "</Personal_Names>")
      replace17 = replace16.gsub("</Organization>", "</Organization_Building>")
      replace18 = replace17.gsub("</Organization-Building>", "</Organization_Building>")
      replace19 = replace18.gsub("</Note>", "</Notes>")
      replace20 = replace19.gsub("</Title_Alternative>", "</Alternate_Title>")
      replace21 = replace20.gsub("</Call_Number>", "</Local_Call_Number>")
      replace22 = replace21.gsub("</Audio_Filename>", "</File_Name>")
      replace23 = replace22.gsub("</Video_Filename>", "</File_Name>")

      replace24 = replace23.gsub("<Filename/>", "<File_Name/>")
      replace25 = replace24.gsub("<Created_by/>", "<Created/>")
      replace26 = replace25.gsub("<Personal_Name/>", "<Personal_Names/>")
      replace27 = replace26.gsub("<Organization/>", "<Organization_Building/>")
      replace28 = replace27.gsub("<Organization-Building/>", "<Organization_Building/>")
      replace29 = replace28.gsub("<Note/>", "<Notes/>")
      replace30 = replace29.gsub("<Title_Alternative/>", "<Alternate_Title/>")
      replace31 = replace30.gsub("<Call_Number/>", "<Local_Call_Number/>")
      replace32 = replace31.gsub("<Audio_Filename/>", "<File_Name/>")
      replace33 = replace32.gsub("<Video_Filename/>", "<File_Name/>")
      replace34 = replace33.gsub("<metadata>", "<metadata>\n  <manifest>\n    <contentdm_collection_id>#{collection_file_name}</contentdm_collection_id>\n    <Rails_Root>#{Rails.root}</Rails_Root>\n    <foxml_dir>#{target_dir}</foxml_dir>\n  </manifest>")
      
    end

    def self.convert_file(file_name, foxml_dir)
      fname = File.basename(file_name, ".xml")
      text = File.read(file_name)
      conformed_text = CDMUtils.conform(text, fname, foxml_dir)
	
      FileUtils::mkdir_p foxml_dir
      File.open(file_name, "w") { |file| file.puts conformed_text }
	
      case fname
        #audio
        when 'p16002coll21'
          `xsltproc #{Rails.root}/lib/tasks/cdm_to_foxml_oralhistory.xsl #{file_name}`
        else
          `xsltproc #{Rails.root}/lib/tasks/cdm_to_foxml_noncustom.xsl #{file_name}`
      end
        
      puts "XSLT transformation complete for #{fname}".green
    end
  end

  def ingest_file(file_name)
    Ingest.ingest_file(file_name)
  end
  module_function :ingest_file # :nodoc:

  class Ingest
    def self.ingest_file(file_name)
      print "Ingest: #{File.basename(file_name)} ..."
      pid = ActiveFedora::FixtureLoader.import_to_fedora(file_name)
      print "\b\b\b(#{pid}) ..."
      status = ActiveFedora::FixtureLoader.index(pid)
      print "\b\b\bDone.\n"
      File.delete(file_name)

      { solr_status: status["responseHeader"]["status"], pid: pid }
    end
  end

  def index(type)
    Index.index(type)
  end
  module_function :index # :nodoc:

  class Index
    def self.find(type_str, pid)
      case type_str
      when 'photograph' then object = Photograph.find(pid)
      when 'transcript' then object = Transcript.find(pid)
      else nil
      end
    end

    def self.index(type)
      type_str = type.to_s.downcase
      collection_count = 0
      ActiveFedora::Base.connection_for_pid('changeme:1') #Fake obj for Rubydora
      ActiveFedora::Base.fedora_connection[0].connection.search(nil) do |object|
        if object.pid.starts_with?(type_str + ':')
          obj = find(type_str, object.pid)
          obj.to_solr
          status = obj.update_index
          if (status["responseHeader"]["status"] == 0) then
            collection_count += 1
            puts "#{obj} indexed".green
          else
            puts "#{obj} failed. #{status['responseHeader']['status']}".red
          end
        end
      end
      collection_count
    end
  end
end

