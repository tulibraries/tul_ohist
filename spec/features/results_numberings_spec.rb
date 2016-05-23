require 'rails_helper'

RSpec.feature "ResultsNumberings", type: :feature do

  before(:all) do
    1.upto 40 do
      m = FactoryGirl.create(:transcript_list)
      m.update_index
    end
  end

  after(:all) do
    Transcript.destroy_all
  end

  xit "shows first items as 11 on the second page" do
    visit "/catalog"
    click_button "Search"
    first(:link, "Next »").click
    expect(page).to have_css("ul[start='11']")
  end

end
