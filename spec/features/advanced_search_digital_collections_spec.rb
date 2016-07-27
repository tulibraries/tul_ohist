require 'rails_helper'

RSpec.feature "AdvancedSearchDigitalCollections", type: :feature do
  context 'Digital Collection Object' do
    let (:t) { FactoryGirl.build(:diaspora_transcript) }
    let (:transcript) { Transcript.create(master_identifier: t.master_identifier, title: t.title, type: t.type, digital_collection: t.digital_collection) }

    before :each do
      transcript.update_index
    end

    it "should show Diaspora" do
      visit "/advanced"
      expect(page).to have_selector("#facet-digital_collection_sim")
    end
  end

end
