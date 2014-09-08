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
                                          repository_collection: t.repository_collection, finding_aid: t.finding_aid, online_exhibit: t.online_exhibit,
                                          catalog_record: t.catalog_record) }
    let (:related_photograph_url) { "http://digital.library.temple.edu/utils/getfile/collection/#{p.contentdm_collection_id}/id/#{p.contentdm_number}/filename/#{p.contentdm_file_name}" }
    let (:related_image_tag) { "<img alt=\"#{p.title.first}\" src=\"#{related_photograph_url}\" />" }
    let (:related_transcript_url) { "http://digital.library.temple.edu/utils/getfile/collection/#{t.contentdm_collection_id}/id/#{t.contentdm_number}/filename/#{t.contentdm_file_name}" }
    let (:finding_aids_label) { "Finding Aids" }
    let (:online_exhibit_label) { "Online Exhibit" }
    let (:catalog_record_label) { "Catalog Record" }

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

    describe 'related_items' do
      let (:items) { related_items(t.master_identifier) }
      let (:finding_aid_index) { 0 }
      let (:online_exhibit_index) { 1 }
      let (:catalog_record_index) { 2 }

      describe 'has finding_aid' do
        subject { items[finding_aid_index] }
        it { is_expected.to include t.finding_aid.first }
      end

      describe 'has online_exhibit' do
        subject { items[online_exhibit_index] }
        it { is_expected.to include t.online_exhibit.first }
      end

      describe 'has catalog_record' do
        subject { items[catalog_record_index] }
        it { is_expected.to include t.catalog_record.first }
      end
    end

    describe 'render_single_list' do
      subject { render_single_list(t.finding_aid, finding_aids_label) }
      it { is_expected.to have_content finding_aids_label }
      it { is_expected.to include "<a href=\"#{t.finding_aid.first}\">" }
    end

    describe 'render_related_items' do
      subject { render_related_items(p.master_identifier) } 
      it { is_expected.to have_content finding_aids_label }
      it { is_expected.to include "<a href=\"#{t.finding_aid.first}\">" }
      it { is_expected.to have_content online_exhibit_label }
      it { is_expected.to include "<a href=\"#{t.online_exhibit.first}\">" }
      it { is_expected.to have_content catalog_record_label }
      it { is_expected.to include "<a href=\"#{t.catalog_record.first}\">" }
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