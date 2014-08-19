require 'rails_helper'

RSpec.describe "transcripts/new", :type => :view do
  before(:each) do
    assign(:transcript, Transcript.new(
      :title => "MyString",
      :date => "MyString",
      :contact => "MyString",
      :digital_publisher => "MyString"
    ))
  end

  it "renders new transcript form" do
    render

    assert_select "form[action=?][method=?]", transcripts_path, "post" do

      assert_select "input#transcript_title[name=?]", "transcript[title]"

      assert_select "input#transcript_date[name=?]", "transcript[date]"

      assert_select "input#transcript_contact[name=?]", "transcript[contact]"

      assert_select "input#transcript_digital_publisher[name=?]", "transcript[digital_publisher]"
    end
  end
end
