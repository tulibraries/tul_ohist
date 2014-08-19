require 'rails_helper'

RSpec.describe "photographs/new", :type => :view do
  before(:each) do
    assign(:photograph, Photograph.new(
      :title => "MyString",
      :date => "MyString",
      :creator => "MyString",
      :digital_publisher => "MyString",
      :format => "MyString"
    ))
  end

  it "renders new photograph form" do
    render

    assert_select "form[action=?][method=?]", photographs_path, "post" do

      assert_select "input#photograph_title[name=?]", "photograph[title]"

      assert_select "input#photograph_date[name=?]", "photograph[date]"

      assert_select "input#photograph_creator[name=?]", "photograph[creator]"

      assert_select "input#photograph_digital_publisher[name=?]", "photograph[digital_publisher]"

      assert_select "input#photograph_format[name=?]", "photograph[format]"
    end
  end
end
