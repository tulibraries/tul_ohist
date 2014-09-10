require 'rails_helper'

describe "catalog/_document" do
  let (:click_through_text) { "Accept to continue" }

  let :document do
    SolrDocument.new :id => 'xyz', :format => 'a', :click_through_ssm => [click_through_text]
  end

  let :blacklight_config do
    Blacklight::Configuration.new
  end

  it "should have click-through text" do
    #allow(view).to receive(:render_grouped_response?).and_return(false)
    allow(view).to receive(:blacklight_config).and_return(blacklight_config)
    stub_template "catalog/_index_header_default.html.erb" => "document_header"
    render :partial => "catalog/document", :locals => {:document => document, :document_counter => 1}
    expect(rendered).to have_text(click_through_text)
  end
  
end
