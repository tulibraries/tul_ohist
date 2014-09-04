require 'rails_helper'

RSpec.describe TulOhistHelper, :type => :helper do

  let (:collection) { "p16002coll21" }
  let (:id) { "0" }
  let (:pdf_file_name) { "1.pdf" }
  let (:image_file_name) { "5.jpg" }

  describe 'theme_contact_field' do
    let (:contact_email) { "abcd@example.com" }
    let (:html_link) { "<a href=\"mailto:#{contact_email}\">#{t('tul_ohist.contact_text')}</a>" }
    it "should generatge a contact field" do
      expect(theme_contact_field("abcd@example.com")).to eq html_link
    end
  end

  context 'related objects' do
    let (:p) { FactoryGirl.build(:photograph) }
    let (:pid) { "#{p.type.first.downcase}:#{p.master_identifier.first}x#{p.contentdm_collection_id}x#{p.contentdm_number}" }
    let (:photograph) { Photograph.create(pid: pid, master_identifier: p.master_identifier, title: p.title, type: p.type, date_created: p.date_created,
                                          date_modified: p.date_modified, contentdm_number: p.contentdm_number, contentdm_file_name: p.contentdm_file_name,
                                          contentdm_file_path: p.contentdm_file_path, contentdm_collection_id: p.contentdm_collection_id) }
    let (:expected_image_url) { "http://digital.library.temple.edu/utils/getfile/collection/#{p.contentdm_collection_id}/id/#{p.contentdm_number}/filename/#{p.contentdm_file_name}" }

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
      it "should get an image url" do
          expect(get_image_url(pid)).to eq expected_image_url
      end
    end

    describe 'render_photo' do

      it "should find a photograph" do
        expected_html_text = "<img alt=\"#{p.title.first}\" src=\"#{expected_image_url}\" />"
        actual_html_text = render_photo(p.master_identifier.first)
        expect(actual_html_text).to eq expected_html_text
      end
    end
  end

  fdescribe 'CONTENTdm access' do

    let (:config) { YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__)) }
    let (:expected_pdf_uri) { "http://digital.library.temple.edu/utils/getfile/collection/#{collection}/id/#{id}/filename/#{pdf_file_name}" } 

    it "should construct a ContentDM getfile URI" do
      file_uri = contentdm_file_url(collection, id, pdf_file_name)
      expect(file_uri).to eq(expected_pdf_uri)
    end
  end

end
