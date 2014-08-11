require 'rake'
require 'nokogiri'

describe 'Execute the tu_cdm rake tests' do

  let (:config) { YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__)) }
  let (:download_collection) { "p16002coll21" }
  let (:private_collection) { "p16002coll11" }
  let (:download_file_name) { "#{download_collection}.xml" }
  let (:cdm_data_root) { "#{Rails.root}/spec/fixtures/fedora/cdm" }

  before :each do
    Rake.application.rake_require "tasks/cdm"
    Rake::Task.define_task(:environment)
    @converted_directory = config['cdm_foxml_dir']
    @download_directory = config['cdm_download_dir']
  end

  describe 'tu_cdm:download' do

    let (:download_file_count) { 34 }

    after :each do
      Rake::Task['tu_cdm:download'].reenable
      FileUtils.rm Dir.glob "#{@download_directory}/*.xml"
    end

    it "should harvest a single CONTENTdm collections" do
      VCR.use_cassette "tu_cdm-download/should_harvest_a_single_ContentDM_file" do
        output = capture(:stdout) do
          Rake::Task['tu_cdm:download'].invoke(download_collection)
        end
        expect(output).to include '1 file downloaded'
        file_count = Dir[File.join(@download_directory, '*.xml')].count { |file| File.file?(file) }
        expect(file_count).to eq(1)
        file = File.join(@download_directory, download_file_name)
        doc = Nokogiri::XML(File.read(file))
        # Tests for both metadata and attempted access to private collection
        expect(['metadata', 'getfile']).to include doc.child.name
      end
    end

    it "should not harvest a private CONTENTdm collections" do
      VCR.use_cassette "tu_cdm-download/should_not_harvest_a_private_ContentDM_file" do
        output = capture(:stdout) do
          Rake::Task['tu_cdm:download'].invoke(private_collection)
        end
        expect(output).to include '0 files downloaded'
        file_count = Dir[File.join(@download_directory, '*.xml')].count { |file| File.file?(file) }
        expect(file_count).to eq(0)
      end
    end

    xit "should harvest ContentDM files" do
      VCR.use_cassette "tu_cdm-download/should_harvest_ContentDM_files" do
        output = capture(:stdout) do
          Rake::Task['tu_cdm:download'].invoke
        end
        expect(output).to include "#{download_file_count} files downloaded"
        file_count = Dir[File.join(@download_directory, '*.xml')].count { |file| File.file?(file) }
        expect(file_count).to be >= download_file_count
        Dir.glob(File.join(@download_directory, '**', '*.xml')).each do |file|
          doc = Nokogiri::XML(File.read(file))
          # Tests for both metadata and attempted access to private collection
          expect(['metadata', 'getfile']).to include doc.child.name
        end
      end
    end
  end

  describe 'tu_cdm:convert' do

    #let (:@converted_directory) { config['cdm_foxml_dir'] }
    let (:schema_url) { "http://www.fedora.info/definitions/1/0/foxml1-1.xsd" }

    before :all do
    end

    after :each do
      Rake::Task['tu_cdm:convert'].reenable
    end

    after :all do
      FileUtils.rm Dir.glob "#{@download_directory}/*.xml"
      FileUtils.rm Dir.glob "#{@converted_directory}/*.xml"
    end

    it "should convert the data" do
      VCR.use_cassette "tu_cdm-convert/should_convert_the_data" do
        Rake::Task['tu_cdm:download'].invoke(download_collection)

        Rake::Task['tu_cdm:convert'].invoke
        file_count = Dir[File.join(@converted_directory, '*.xml')].count { |file| File.file?(file) }
        converted_file_count = `grep -ic "<record>" tmp/tu_cdm/downloads/*`.to_i
        expect(file_count).to eq(converted_file_count)
      end
    end

    it "should have valid FOXML" do
      VCR.use_cassette "tu_cdm-convert/should_have_valid_FOXML" do
        Rake::Task['tu_cdm:download'].invoke(download_collection)
        Rake::Task['tu_cdm:convert'].invoke
        xsd = Nokogiri::XML::Schema(open(schema_url))
        Dir.glob(File.join(@converted_directory, '**', '*.xml')).each do |file|
          doc = Nokogiri::XML(File.read(file))
          xsd.validate(doc).each do |error|
            puts error
          end
          expect(xsd.valid?(doc)).to be
        end
      end
    end
  end
end
