require 'rails_helper'

RSpec.describe TulOhistHelper, :type => :helper do

  let (:collection) { "p16002coll21" }
  let (:id) { "0" }
  let (:pdf_file_name) { "1.pdf" }
  let (:image_file_name) { "5.jpg" }

  describe 'theme_contact_field' do
    let (:contact_email) { "abcd@example.com" }
    let (:html_email_link) { "<a href=\"mailto:#{contact_email}\">#{t('tul_ohist.contact_text')}</a>" }

    subject { theme_contact_field(contact_email) }
    it { is_expected.to eq html_email_link }
  end

  context 'related objects' do
    let (:p) { FactoryGirl.build(:photograph) }
    let (:pid) { "#{p.type.first.downcase}:#{p.master_identifier.first}x#{p.contentdm_collection_id}x#{p.contentdm_number}" }
    let (:photograph) { Photograph.create(pid: pid, master_identifier: p.master_identifier, title: p.title, type: p.type, date_created: p.date_created,
                                          date_modified: p.date_modified, contentdm_number: p.contentdm_number, contentdm_file_name: p.contentdm_file_name,
                                          contentdm_file_path: p.contentdm_file_path, contentdm_collection_id: p.contentdm_collection_id) }
    let (:related_url) { "http://digital.library.temple.edu/utils/getfile/collection/#{p.contentdm_collection_id}/id/#{p.contentdm_number}/filename/#{p.contentdm_file_name}" }
    let (:related_image_tag) { "<img alt=\"#{p.title.first}\" src=\"#{related_url}\" />" }

    before do
      photograph.update_index
    end

    describe 'get_related_objects' do
      it "should find a photograph" do
        objects = get_related_objects(p.master_identifier)
        expect(objects.first.master_identifier).to match_array(p.master_identifier)
      end
    end
    
    describe 'get_image_url' do
      subject { get_image_url(pid) }
      it { is_expected.to eq related_url }
    end

    describe 'render_photo' do
      subject { render_photo(p.master_identifier.first) }
      it { is_expected.to eq related_image_tag }
    end
  end

  describe 'CONTENTdm access' do

    let (:config) { YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__)) }
    let (:contentdm_pdf_url) { "http://digital.library.temple.edu/utils/getfile/collection/#{collection}/id/#{id}/filename/#{pdf_file_name}" } 

    it "should construct a ContentDM getfile URI" do
      expect(contentdm_file_url(collection, id, pdf_file_name)).to eq(contentdm_pdf_url)
    end
  end

end
