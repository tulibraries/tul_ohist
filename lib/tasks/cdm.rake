require "active-fedora"
require "open-uri"
require "fileutils"

namespace :tu_cdm do
  
  OpenURI::Buffer.send :remove_const, 'StringMax'
  OpenURI::Buffer.const_set 'StringMax', 0

  config = YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__))

  desc "List current ContentDM collections on the CDM server"  
  task :list => :environment do
    collections = CDMUtils.list(config['cdm_server'])
    collections.each do |c|
      puts c.to_s
    end
  end

  desc "Download ContentDM collection(s) in XML from CDM servewr"
  task :download, [:collection_name] => :environment do |t, args|
    args.download(:collection_name => nil)
    if args[:collection_name]
      converted = CDMUtils.download_one_collection(config, args[:collection_name])
    else
      converted = CDMUtils.download_all_collections(config)
    end
  end


  desc 'Convert ContentDM custom XML to FOXML'
  task :convert => :environment do
    u_files = Dir.glob("#{config['cdm_download_dir']}/*.xml").select { |fn| File.file?(fn) }
    puts "#{u_files.length} collections detected"
    
    #TODO: exclude p16002coll10 and p16002coll18
    u_files.length.times do |i|
      CDMUtils.convert_file(u_files[i], config['cdm_foxml_dir'])
    end

  end
  
    
  desc "Ingest all converted and up-to-date ContentDM objects into Fedora"  
  task :ingest => :environment do
    contents = ENV['DIR'] ? Dir.glob(File.join(ENV['DIR'], "*.xml")) : Dir.glob("#{config['cdm_foxml_dir']}/*.xml")
    contents.each do |file|
      pid = CDMUtils.ingest_file(file)
    end
    puts "All files ingested -- phew!".green
    
  end
    
  namespace :solr do
    desc "Reindex everything in Solr"
    task :reindex_all => :environment do
      ActiveFedora::Base.reindex_everything()
    end

    desc "Delete a single item from Solr index"
    task :delete_one => :environment do
      #delete an object by ID from the Solr index:
      solr.delete_by_id("dpla:dpla_2", params: {'softCommit' => true})
    end
  end
    
    
    
    
  namespace :index do
    desc 'Index all Photograph objects in Fedora repo.'
    task :photographs => :environment do
      CDMUtils.index(Photograph)
    end
    
    desc 'Index all Poster objects in Fedora repo.'
    task :posters => :environment do
      CDMUtils.index(Poster)
    end
    
    desc 'Index all Pamphlets objects in Fedora repo.'
    task :pamphlets => :environment do
      CDMUtils.index(Pamphlet)
    end
    
    desc 'Index all Manuscript objects in Fedora repo.'
    task :manuscripts => :environment do
      CDMUtils.index(Manuscript)
    end
    
    desc 'Index all Sheet Music objects in Fedora repo.'
    task :sheetmusic => :environment do
      CDMUtils.index(SheetMusic)
    end
  end
end

