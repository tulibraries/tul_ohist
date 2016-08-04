require 'nokogiri'

describe 'List CONTENTdm collections' do

  let (:config) { YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__)) }
  let (:collection_name) { "p16002coll21" }
  let (:private_collection_name) { "p16002coll11" }
  let (:cdm_data_root) { "#{Rails.root}/spec/fixtures/fedora/cdm" }
  let (:schema_url) { "http://www.fedora.info/definitions/1/0/foxml1-1.xsd" }
  let (:download_directory) { config['cdm_download_dir'] }
  let (:converted_directory) { config['cdm_foxml_dir'] }
  let (:number_of_collections) { 33 }
  let (:download_file_count) { 33 }

  describe 'list' do
    it "should list ContentDM collections" do
      collections = CDMUtils.list(config['cdm_server'])
      expect(collections.length).to be >= number_of_collections
    end
  end

  describe 'download' do
    after :each do
      FileUtils.rm Dir.glob "#{download_directory}/*.xml"
    end

    it "should download a single collection" do
      VCR.use_cassette "cdm-util-download/should_harvest_a_single_ContentDM_file" do
        downloaded = CDMUtils.download_one_collection(config, collection_name)
        file_count = Dir[File.join(download_directory, '*.xml')].count { |file| File.file?(file) }
        expect(file_count).to eq(1)
        file = File.join(download_directory, collection_name + '.xml')
        doc = Nokogiri::XML(File.read(file))
        # Tests for both metadata and attempted access to private collection
        expect(['metadata', 'getfile']).to include doc.child.name
      end
    end

    it "should not download a private collection" do
      VCR.use_cassette "cdm-util-download/should_not_harvest_a_private_ContentDM_file" do
        downloaded = CDMUtils.download_one_collection(config, private_collection_name)
        expect(downloaded).to eq(0)
        file_count = Dir[File.join(download_directory, '*.xml')].count { |file| File.file?(file) }
        expect(file_count).to eq(0)
      end
    end
  end

  describe 'convert' do
    include TagMatchers
    let (:source_file_name) { collection_name + '.xml' }

    after :each do
      FileUtils.rm Dir.glob "#{download_directory}/*.xml"
      FileUtils.rm Dir.glob "#{converted_directory}/*.xml"
    end
 
    it "should conform a single collection file" do
      VCR.use_cassette "cdm-util-convert/should_conform_a_ContentDM_file" do
        downloaded = CDMUtils.download_one_collection(config, collection_name)
        collection_file =  collection_name + '.xml'

        text = File.read(File.join(download_directory, collection_file))
        doc = Nokogiri::XML(CDMUtils.conform(text, collection_file, converted_directory))
        
        expect(doc).to have_tag('manifest')
        expect(doc).to_not have_tag('Organization-Building')
        expect(doc).to have_tag('Organization_Building')
        expect(doc).to_not have_tag('Created_by')
        expect(doc).to have_tag('Created')
        expect(doc).to have_tag('contentdm_collection_id')
        expect(doc.search('contentdm_collection_id').text).to include collection_file
        expect(doc).to have_tag('Rails_Root')
        expect(doc).to have_tag('foxml_dir')
      end
    end

    it "should convert a single collection file" do
      VCR.use_cassette "cdm-util-convert/should_convert_a_ContentDM_file" do
        downloaded = CDMUtils.download_one_collection(config, collection_name)
        file_count = Dir[File.join(converted_directory, '*.xml')].count { |file| File.file?(file) }
        CDMUtils.convert_file(File.join(download_directory, collection_name + '.xml'), converted_directory)
        xml_file_count = `grep -ic "<record>" tmp/tu_cdm/downloads/*`.to_i
        expect(file_count).to eq(xml_file_count)
        xsd = Nokogiri::XML::Schema(open(schema_url))
        Dir.glob(File.join(converted_directory, '**', '*.xml')).each do |file|
          doc = Nokogiri::XML(File.read(file))
          xsd.validate(doc).each do |error|
            puts error
          end
          expect(xsd.valid?(doc)).to be
        end
      end
    end
  end

  describe 'validate' do
    let (:valid_file)   { "spec/fixtures/foxml/valid.xml" }
    let (:invalid_file) { "spec/fixtures/foxml/invalid.xml" }

    it "should check validate" do
      expect(CDMUtils.validate(valid_file)).to be
    end

    it "should check invalid" do
      expect(CDMUtils.validate(invalid_file)).to_not be
    end
  end

  describe 'ingest' do
    let (:source_file_name) { collection_name + '.xml' }
    let (:ingest_pid) { "pid:001" }

    after :each do
      FileUtils.rm Dir.glob "#{download_directory}/*.xml"
      FileUtils.rm Dir.glob "#{converted_directory}/*.xml"
    end
 
    it "should ingest a collection" do
      downloaded = CDMUtils.download_one_collection(config, collection_name)
      CDMUtils.convert_file(File.join(download_directory, collection_name + '.xml'), converted_directory)
      contents = ENV['DIR'] ? Dir.glob(File.join(ENV['DIR'], "*.xml")) : Dir.glob("#{converted_directory}/*.xml")
      ingested_count = 0
      contents.each do |file|
        allow(ActiveFedora::FixtureLoader).to receive(:import_to_fedora).with(file).and_return(ingest_pid)
        allow(ActiveFedora::FixtureLoader).to receive(:index).and_return({"responseHeader"=>{"status"=>0, "QTime"=>1}})
        status = CDMUtils.ingest_file(file)
        ingested_count += status[:solr_status] != 0 ? 0 : 1
        expect(status[:solr_status]).to equal 0
        expect(status[:pid]).to match ingest_pid
      end
      expect(ingested_count).to equal(contents.length)
    end
  end
end
