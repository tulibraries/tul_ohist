require "active-fedora"
require "open-uri"
require "fileutils"

namespace :tu_cdm do
  
  OpenURI::Buffer.send :remove_const, 'StringMax'
  OpenURI::Buffer.const_set 'StringMax', 0

  config = YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__))
  config_bg = YAML.load_file(File.expand_path("#{Rails.root}/config/backups.yml", __FILE__))

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
      downloaded = CDMUtils.download_one_collection(config, args[:collection_name])
    else
      downloaded = CDMUtils.download_all_collections(config)
    end

    message = "#{downloaded} #{'file'.pluralize(downloaded)} downloaded"
    puts downloaded == 0 ?  "Warning: #{message}".colorize(:red) : message
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

desc 'Verify converted downloads, backup the repo, and clean in preperation for ingest -- USE WITH CAUTION'
  task :verify_backup_clean => :environment do
    contents = Dir.glob("#{config['cdm_foxml_dir']}/*.xml").count

    index_i = 0
    ActiveFedora::Base.find_each({}, batch_size: 2000) do |o|
      index_i += 1
    end
    
    puts "Index: #{index_i}"
    puts "Contents: #{contents}"

    if contents >= index_i
      
      jetty_backup_dir = "#{config_bg['backup_interstitial']}/tul_ohist_jetty_db_backup_#{Time.now.to_i.to_s}"
      FileUtils::mkdir_p jetty_backup_dir
      `cp -R #{Rails.root}/jetty #{jetty_backup_dir}`
      `cp -R #{Rails.root}/db #{jetty_backup_dir}`
      `cp -R #{Rails.root}/log/cron_log.log #{jetty_backup_dir}`
      `zip -r #{jetty_backup_dir}.bkup.zip #{jetty_backup_dir}`
      `rsync -avP --no-o --no-p --no-g #{jetty_backup_dir}.bkup.zip #{config_bg['backup_permanent']}`

      puts "Fedora state #{Time.now} backed up to #{jetty_backup_dir}"
      records_num = 0
      ActiveFedora::Base.find_each({},batch_size: 2000) do |o|
        CDMUtils.delete_object(o)
        records_num += 1
      end
      puts "#{records_num} objects deleted from Fedora"

    elsif
      CdmMailer.report_download_errors.deliver
      abort("Count of downloaded files is less than that in the current repository.  Aborting rake task.")
    end
  end

  desc "test mailer functions"
  task :mail_thing => :environment do
    CdmMailer.report_download_errors.deliver
  end
  
  desc "Ingest all converted and up-to-date ContentDM objects into Fedora"  
  task :ingest => :environment do
    contents = ENV['DIR'] ? Dir.glob(File.join(ENV['DIR'], "*.xml")) : Dir.glob("#{config['cdm_foxml_dir']}/*.xml")
    contents.each do |file|
      pid = CDMUtils.ingest_file(file)
    end
    puts "All files ingested -- phew!".green
    CdmMailer.report_success.deliver
  end
    
  namespace :solr do
    desc "Reindex everything in Solr"
    task :reindex_all => :environment do
      ActiveFedora::Base.reindex_everything
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
    
    desc 'Index all Transcript objects in Fedora repo.'
    task :transcripts => :environment do
      CDMUtils.index(Transcript)
    end
  end
end

