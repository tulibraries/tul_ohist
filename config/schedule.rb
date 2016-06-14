set :environment, "development"
tul_ohist_config = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'tul_ohist.yml'), __FILE__))
set :output, {:error    => File.join(File.dirname(__FILE__), '..', 'log', tul_ohist_config['cron_error_log']),
              :standard => File.join(File.dirname(__FILE__), '..', 'log', tul_ohist_config['cron_log'])}

every :sunday, :at => '2:00 am' do
  command 'echo "Starting download"'
  rake "log:clear"
  rake "tu_cdm:download[p16002coll22]" 
end

every :sunday, :at => '2:10 am' do
  command 'echo "Starting convert"'
  rake "tu_cdm:convert"
end

every :sunday, :at => '2:20 am' do
  command 'echo "Starting backup and clean"'
  rake "tu_cdm:verify_backup_clean"
end

every :sunday, :at => '2:40 am' do
  command 'echo "Starting ingest"'
  rake "tu_cdm:ingest" 
end

every :sunday, :at => '2:55 am' do
  command 'echo "Starting index transcripts"'
  rake "tu_cdm:index:transcripts" 
end

every :sunday, :at => '3:00 am' do
  command 'echo "Starting index photographs"'
  rake "tu_cdm:index:photographs"
end
