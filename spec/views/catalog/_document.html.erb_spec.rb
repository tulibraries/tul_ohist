require 'rails_helper'

describe "catalog/_document" do

  let (:click_through_text) { "Accept to continue" }
  let :blacklight_config do
    Blacklight::Configuration.new
  end

  let :document do
    SolrDocument.new :id => 'xyz', :format => 'a', :click_through_ssm => [click_through_text]
  end

  before do
    allow(view).to receive(:render_grouped_response?).and_return(false)
    allow(view).to receive(:blacklight_config).and_return(blacklight_config)
  end

  it "should render the header, thumbnail and index by default" do
    stub_template "catalog/_index_header_default.html.erb" => "document_header"
    stub_template "catalog/_thumbnail_default.html.erb" => "thumbnail_default"
    stub_template "catalog/_index_default.html.erb" => "index_default"
    render :partial => "catalog/document", :locals => {:document => document, :document_counter => 1}
    expect(rendered).to match /document_header/
    expect(rendered).to match /thumbnail_default/
    expect(rendered).to match /index_default/
    expect(rendered).to have_selector('div.document[@itemscope]')
    expect(rendered).to have_selector('div.document[@itemtype="http://schema.org/Thing"]')
  end

  it "should use the index.partials parameter to determine the partials to render" do
    blacklight_config.index.partials = ['a', 'b', 'c']
    stub_template "catalog/_a_default.html.erb" => "a_partial"
    stub_template "catalog/_b_default.html.erb" => "b_partial"
    stub_template "catalog/_c_default.html.erb" => "c_partial"
    render :partial => "catalog/document", :locals => {:document => document, :document_counter => 1}
    expect(rendered).to match /a_partial/
    expect(rendered).to match /b_partial/
    expect(rendered).to match /c_partial/
  end

  it "should have click-through" do
    document = SolrDocument.new :id => 'xyz', :format => 'a', :click_through_ssm => [click_through_text]
    stub_template "catalog/_index_header_default.html.erb" => "document_header"
    render :partial => "catalog/document", :locals => {:document => document, :document_counter => 1}
    expect(rendered).to have_text(click_through_text)
  end
  
end
