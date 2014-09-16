#Given(/^the following oral histories exist:$/) do |oral_histories|
Given(/^the following transcripts exist:$/) do |oral_histories|
  WebMock.disable_net_connect!(:allow_localhost => true)
  oral_histories.hashes.each do |o|
    type = ["Transcript"]
    date = ["2014-08-31"]
    rights_statement = ["Rights statement."]
    contentdm_number = "0"
    contentdm_collection_id = "p16002coll21"
    contentdm_file_name = "1.pdf"
    collection_description = ""
    transcript_pid = "#{type.first.downcase}:#{o["master identifier"]}x#{contentdm_collection_id}x#{contentdm_number}"
    transcript = Transcript.create(pid: transcript_pid, master_identifier: [o["master identifier"]], title: [o[:title]],
                                   contentdm_number: contentdm_number, contentdm_collection_id: contentdm_collection_id,
                                   contentdm_file_name: contentdm_file_name, 
                                   rights: rights_statement, click_through: [o["click through"]])
    transcript.update_index
  end
end

When(/^I visit the home page$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

When(/^I click on the "(.*?)" button$/) do |button_name|
  click_button(button_name)
end

When(/^I visit "(.*?)"$/) do |oral_history|
  click_link(oral_history)
end

Then(/^I should see license "(.*?)"$/) do |license_text|
  binding.pry
  expect(page).to have_selector('div')
end
