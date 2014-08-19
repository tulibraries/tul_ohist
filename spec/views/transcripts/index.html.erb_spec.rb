require 'rails_helper'

RSpec.describe "transcripts/index", :type => :view do
  before(:each) do
    assign(:transcripts, [
      Transcript.create!(
        :title => "Title",
        :date => "Date",
        :contact => "Contact",
        :digital_publisher => "Digital Publisher"
      ),
      Transcript.create!(
        :title => "Title",
        :date => "Date",
        :contact => "Contact",
        :digital_publisher => "Digital Publisher"
      )
    ])
  end

  it "renders a list of transcripts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Digital Publisher".to_s, :count => 2
  end
end
