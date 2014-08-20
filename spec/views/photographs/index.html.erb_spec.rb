require 'rails_helper'

RSpec.describe "photographs/index", :type => :view do
  before(:each) do
    assign(:photographs, [
      Photograph.create!(
        :title => "Title",
        :date => "Date",
        :creator => "Creator",
        :digital_publisher => "Digital Publisher",
        :format => "Format"
      ),
      Photograph.create!(
        :title => "Title",
        :date => "Date",
        :creator => "Creator",
        :digital_publisher => "Digital Publisher",
        :format => "Format"
      )
    ])
  end

  it "renders a list of photographs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "Creator".to_s, :count => 2
    assert_select "tr>td", :text => "Digital Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Format".to_s, :count => 2
  end
end
