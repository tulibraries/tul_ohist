require "rails_helper"

RSpec.describe CdmMailer, type: :mailer do
  let(:config) { YAML.load_file(File.expand_path(File.join(Rails.root, 'config', 'tul_ohist.yml'), __FILE__)) }
  let(:logfile) { YAML.load_file(File.expand_path(File.join(Rails.root, 'log', config['ingest_log']))) }
 
  before :each do
    ActionMailer::Base.deliveries = []
  end

  describe "Report download errors mailer" do
    let(:mail) { CdmMailer.report_download_errors.deliver }

    describe "Deliver download error message by email" do
      specify { expect(mail.to).to include(config['email_recipient']) }
      specify { expect(mail.subject).to match I18n.t('tul_ohist.mailer.nightly_download_error.subject') }
      specify { expect(mail.text_part.body.raw_source).to match I18n.t('tul_ohist.mailer.nightly_download_error.body') }
      specify { expect(mail.attachments.first.filename).to eq File.basename(config['cron_error_log']) }
    end
  end

  describe "Ingest error messages mailer" do
    let(:mail) { CdmMailer.report_ingest_errors.deliver }

    describe "Deliver ingest error message by email" do
      specify { expect(mail.to).to include(config['email_recipient']) }
      specify { expect(mail.subject).to match I18n.t('tul_ohist.mailer.ingest_error.subject') }
      specify { expect(mail.text_part.body.raw_source).to match I18n.t('tul_ohist.mailer.ingest_error.body') }
      specify { expect(mail.attachments.first.filename).to eq File.basename(config['ingest_log']) }
    end
  end

  describe "Backup success message mailer" do
    let(:mail) { CdmMailer.report_success.deliver }

    describe "Deliver successful backup message by email" do
      specify { expect(mail.to).to include(config['email_recipient']) }
      specify { expect(mail.subject).to match I18n.t('tul_ohist.mailer.backup_log.subject') }
      specify { expect(mail.text_part.body.raw_source).to match I18n.t('tul_ohist.mailer.backup_log.body') }
      specify { expect(mail.attachments.first.filename).to eq File.basename(config['cron_log']) }
    end
  end
end
