require 'rails_helper'

RSpec.describe "photographs/show", :type => :view do
  before(:each) do
    @photograph = assign(:photograph, Photograph.create!(
      :title => "Title",
      :date => "Date",
      :creator => "Creator",
      :digital_publisher => "Digital Publisher",
      :format => "Format"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/Creator/)
    expect(rendered).to match(/Digital Publisher/)
    expect(rendered).to match(/Format/)
  end
end
