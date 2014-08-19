require 'rails_helper'

RSpec.describe "photographs/edit", :type => :view do
  before(:each) do
    @photograph = assign(:photograph, Photograph.create!(
      :title => "MyString",
      :date => "MyString",
      :creator => "MyString",
      :digital_publisher => "MyString",
      :format => "MyString"
    ))
  end

  it "renders the edit photograph form" do
    render

    assert_select "form[action=?][method=?]", photograph_path(@photograph), "post" do

      assert_select "input#photograph_title[name=?]", "photograph[title]"

      assert_select "input#photograph_date[name=?]", "photograph[date]"

      assert_select "input#photograph_creator[name=?]", "photograph[creator]"

      assert_select "input#photograph_digital_publisher[name=?]", "photograph[digital_publisher]"

      assert_select "input#photograph_format[name=?]", "photograph[format]"
    end
  end
end
