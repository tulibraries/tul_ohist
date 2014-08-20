require 'rails_helper'

RSpec.describe "transcripts/edit", :type => :view do
  before(:each) do
    @transcript = assign(:transcript, Transcript.create!(
      :title => "MyString",
      :date => "MyString",
      :contact => "MyString",
      :digital_publisher => "MyString"
    ))
  end

  it "renders the edit transcript form" do
    render

    assert_select "form[action=?][method=?]", transcript_path(@transcript), "post" do

      assert_select "input#transcript_title[name=?]", "transcript[title]"

      assert_select "input#transcript_date[name=?]", "transcript[date]"

      assert_select "input#transcript_contact[name=?]", "transcript[contact]"

      assert_select "input#transcript_digital_publisher[name=?]", "transcript[digital_publisher]"
    end
  end
end
