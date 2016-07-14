class CdmMailer < ApplicationMailer
  
  default from: "No-Reply LibDigital <no-reply-libdigital@temple.edu>"

  def report_download_errors
    tul_ohist_config = YAML.load_file(File.expand_path(File.join('config', 'tul_ohist.yml')))
    attachments[tul_ohist_config['cron_error_log']] = File.read(File.join('log', tul_ohist_config['cron_error_log']))
    mail(to:      tul_ohist_config['email_recipient'],
         subject: t('tul_ohist.mailer.nightly_download_error.subject'),
         body:    t('tul_ohist.mailer.nightly_download_error.body'))
  end

  def report_ingest_errors
    tul_ohist_config = YAML.load_file(File.expand_path(File.join('config', 'tul_ohist.yml')))
    attachments[tul_ohist_config['ingest_log']] = File.read(File.join('log', tul_ohist_config['ingest_log']))
    mail(to:      tul_ohist_config['email_recipient'],
         subject: t('tul_ohist.mailer.ingest_error.subject'),
         body:    t('tul_ohist.mailer.ingest_error.body'))
  end

  def report_success
    tul_ohist_config = YAML.load_file(File.expand_path(File.join('config', 'tul_ohist.yml')))
    attachments[tul_ohist_config['cron_log']] = File.read(File.join('log', tul_ohist_config['cron_log']))
    mail(to:      "tuf73699@temple.edu,tug34268@temple.edu",
         subject: t('tul_ohist.mailer.backup_log.subject'),
         body:    t('tul_ohist.mailer.backup_log.body'))
  end
end
