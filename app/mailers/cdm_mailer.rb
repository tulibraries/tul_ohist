class CdmMailer < ApplicationMailer
  
  default from: "No-Reply LibDigital <no-reply-libdigital@temple.edu>"

  def report_download_errors
    attachments[tul_ohist_config['cron_error_log']] = File.read(File.join('log', tul_ohist_config['cron_error_log']))
    mail(:to => "tuf73699@temple.edu,tug34268@temple.edu", :subject => "ERROR: CONTENTdm download for TULOHIST error", :body => "Something went wrong during the CONTENTdm nightly download.  Please see attached error log.")
  end

  def report_ingest_errors
    tul_ohist_config = YAML.load_file(File.expand_path(File.join('config', 'tul_ohist.yml')))
    attachments[tul_ohist_config['ingest_log']] = File.read(File.join('log', tul_ohist_config['ingest_log']))
    mail(:to => "tuf73699@temple.edu,tug34268@temple.edu", :subject => "ERROR: CONTENTdm ingest for TULOHIST error", :body => "Something went wrong during the CONTENTdm nightly download.  Please see attached error log.")
  end

  def report_success
    tul_ohist_config = YAML.load_file(File.expand_path(File.join('config', 'tul_ohist.yml')))
    attachments[tul_ohist_config['cron_log']] = File.read(File.join('log', tul_ohist_config['cron_log']))
    mail(:to => "tuf73699@temple.edu,tug34268@temple.edu", :subject => "SUCCESS: CONTENTdm backup and reindex for TULOHIST", :body => "Successful backup and reingest of TULOHIST collection items. Please see attached log for more information.")
  end
end
