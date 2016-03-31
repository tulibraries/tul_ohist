class CdmMailer < ApplicationMailer
  
  default from: "No-Reply LibDigital <no-reply-libdigital@temple.edu>"

  def report_download_errors
    attachments['cron_errors.log'] = File.read('log/cron_error_log.log')
    mail(:to => "tuf15651@temple.edu", :subject => "ERROR: CONTENTdm download for TULOHIST error", :body => "Something went wrong during the CONTENTdm nightly download.  Please see attached error log.")
  end

  def report_success
    attachments['cron_log.txt'] = File.read('log/cron_log.log')
    mail(:to => "tuf15651@temple.edu", :subject => "SUCCESS: CONTENTdm backup and reindex for TULOHIST", :body => "Successful backup and reingest of TULOHIST collection items. Please see attached log for more information.")
  end
end
