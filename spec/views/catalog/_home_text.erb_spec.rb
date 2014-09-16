require 'rails_helper'

describe '/catalog/_home_text.html.erb' do
  before (:each) do
    allow(view).to receive(:blacklight_config).and_return(CatalogController.blacklight_config)
  end

  it "should show Browse by... links" do
    render
    expect(rendered).to have_content "Browse by Narrator"
    expect(rendered).to have_content "Browse by Subject"
  end
end
