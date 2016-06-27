require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AudioPlayerHelper. For example:
#
# describe AudioPlayerHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TulOhistHelper, type: :helper do

    describe 'render_audio_player' do
      let (:audio_player_query) {
        player_html_source = render_audio_player(t.ensemble_identifier.first)
        player_html_doc = Nokogiri::HTML.parse(player_html_source)
        player_uri = player_html_doc.xpath("//html/body/*/script").attribute("src").value

        query_string = URI(player_uri).query
        CGI::parse query_string
      }

      subject { audio_player_query["contentID"] }

      context 'with audio' do
        let (:t) { FactoryGirl.build(:transcript, has_audio: true) }
        it { is_expected.to eq(t.ensemble_identifier) }
      end

      context 'without audio' do
        let (:t) { FactoryGirl.build(:transcript) }
        it { is_expected.to_not eq(t.ensemble_identifier) }
      end
    end

end
