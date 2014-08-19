require 'rails_helper'

RSpec.describe "transcripts/show", :type => :view do
  before(:each) do
    @transcript = assign(:transcript, Transcript.create!(
      :title => "Title",
      :date => "Date",
      :contact => "Contact",
      :digital_publisher => "Digital Publisher"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Digital Publisher/)
  end
end
