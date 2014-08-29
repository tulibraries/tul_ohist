require 'rails_helper'

RSpec.describe TulOhistHelper, :type => :helper do

  describe 'theme_contact_field' do
    let (:contact_email) { "abcd@example.com" }
    let (:html_link) { "<a href=\"mailto:#{contact_email}\">#{t('tul_ohist.contact_text')}</a>" }
    fit "should generatge a contact field" do
      expect(theme_contact_field("abcd@example.com")).to eq html_link
    end
  end

  describe 'CONTENTdm access' do

    let (:config) { YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__)) }
    let (:expected_pdf_uri) { "http://digital.library.temple.edu/utils/getfile/collection/p16002coll21/id/0/filename/1.pdf" } 

    it "should construct a ContentDM getfile URI" do
      collection = "p16002coll21"
      id = "0"
      file_name = "1.pdf"
      file_uri = contentdm_file_url(collection, id, file_name)
      expect(file_uri).to eq(expected_pdf_uri)
    end
  end

end
