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
    let (:t) { FactoryGirl.build(:transcript) }
    let (:photograph_pid) { "#{p.type.first.downcase}:#{p.master_identifier.first}x#{p.contentdm_collection_id}x#{p.contentdm_number}" }
    let (:transcript_pid) { "#{t.type.first.downcase}:#{t.master_identifier.first}x#{t.contentdm_collection_id}x#{t.contentdm_number}" }
    let (:photograph) { Photograph.create(pid: photograph_pid, master_identifier: p.master_identifier, title: p.title, type: p.type, date_created: p.date_created,
                                          date_modified: p.date_modified, contentdm_number: p.contentdm_number, contentdm_file_name: p.contentdm_file_name,
                                          contentdm_file_path: p.contentdm_file_path, contentdm_collection_id: p.contentdm_collection_id) }
    let (:transcript) { Transcript.create(pid: transcript_pid, master_identifier: t.master_identifier, title: t.title, type: t.type, date_created: t.date_created,
                                          date_modified: t.date_modified, contentdm_number: t.contentdm_number, contentdm_file_name: t.contentdm_file_name,
                                          contentdm_file_path: t.contentdm_file_path, contentdm_collection_id: t.contentdm_collection_id,
                                          repository_collection: t.repository_collection, finding_aid_link: t.finding_aid_link, finding_aid_title: t.finding_aid_title,
                                          online_exhibit_link: t.online_exhibit_link, online_exhibit_title: t.online_exhibit_title, catalog_record_link: t.catalog_record_link, 
                                          catalog_record_title: t.catalog_record_title) }
    let (:related_photograph_url) { "http://digital.library.temple.edu/utils/getfile/collection/#{p.contentdm_collection_id}/id/#{p.contentdm_number}/filename/#{p.contentdm_file_name}" }
    let (:related_image_tag) { "<img alt=\"#{p.title.first}\" src=\"#{related_photograph_url}\" />" }
    let (:related_transcript_url) { "http://digital.library.temple.edu/utils/getfile/collection/#{t.contentdm_collection_id}/id/#{t.contentdm_number}/filename/#{t.contentdm_file_name}" }

    before do
      transcript.update_index
      photograph.update_index
    end

    describe 'get_related_objects' do
      subject { get_related_objects(p.master_identifier) }
      it { is_expected.to have_object_of_type ("Photograph") }
      it { is_expected.to have_object_of_type ("Transcript") }
    end
    
    describe 'get_image_url' do
      subject { get_image_url(photograph_pid) }
      it { is_expected.to eq related_photograph_url }
    end

    describe 'render_photo' do
      subject { render_photo(p.master_identifier.first) }
      it { is_expected.to eq related_image_tag }
    end

    describe 'locate_by_model' do
      subject { locate_by_model(photograph_pid).type.first }
      it { is_expected.to eq "Photograph" }
    end

    describe 'related_resources' do
      let (:resources) { related_resources(t.master_identifier) }
      let (:finding_aid_index) { 0 }
      let (:online_exhibit_index) { 1 }
      let (:catalog_record_index) { 2 }

      describe 'has finding_aid_link' do
        subject { resources[finding_aid_index] }
        it { is_expected.to include t.finding_aid_link.first }
      end

      describe 'has online_exhibit_link' do
        subject { resources[online_exhibit_index] }
        it { is_expected.to include t.online_exhibit_link.first }
      end

      describe 'has catalog_record_link' do
        subject { resources[catalog_record_index] }
        it { is_expected.to include t.catalog_record_link.first }
      end
    end

    describe 'render_single_list' do
      subject { render_single_list(related_resources(t.master_identifier)) }
      it { is_expected.to have_content t.finding_aid_title.first }
      it { is_expected.to include "<a href=\"#{t.finding_aid_link.first}\">" }
    end

    describe 'render_related_resources' do
      subject { render_related_resources(p.master_identifier) } 
      it { is_expected.to have_content t.finding_aid_title.first }
      it { is_expected.to include "<a href=\"#{t.finding_aid_link.first}\">" }
      it { is_expected.to have_content t.online_exhibit_title.first }
      it { is_expected.to include "<a href=\"#{t.online_exhibit_link.first}\">" }
      it { is_expected.to have_content t.catalog_record_title.first }
      it { is_expected.to include "<a href=\"#{t.catalog_record_link.first}\">" }
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
