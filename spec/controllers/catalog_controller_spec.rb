describe 'CatalogController' do
  subject { CatalogController.new }

  describe 'Blacklight Advanced Search' do
    it { is_expected.to respond_to(:advanced_search_path) }
  end

  context 'Composed Object' do
    let (:t) { FactoryGirl.build(:transcript) }
    let (:transcript) { Transcript.create(master_identifier: t.master_identifier, title: t.title, type: t.type) }
    let (:p) { FactoryGirl.build(:photograph) }
    let (:photograph) { Photograph.create(master_identifier: p.master_identifier, title: p.title, type: p.type) }
    let (:solr_params) {}
    let (:user) {}

    describe 'Unwanted Models' do
      it "should filter out photographs"
    end

    describe 'Exclude Unwanted Models' do
      it "should exclude the Photograph model"
    end

  end
end
