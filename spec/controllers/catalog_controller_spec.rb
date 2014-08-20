describe 'CatalogController' do
  subject { CatalogController.new }

  describe 'Blacklight Advanced Search' do
    it { is_expected.to respond_to(:advanced_search_path) }
  end
end
