Feature: Click-through agreement
Oral histories are covered by various licenses granted to Temple University
Libraries by the narrators. We need to have users agree to these licenses 
before they view oral history assets.

NOTE: Step definitons are incomplete. These are valid tests if run manually.
Pull Requests are welcome

In order to allow users access to assets covered license agreements
So that we can reasonably insure that users agree to license agreement to view the assets
We want users to agree to the license agreement before they view the assets

Background:
  Given the following transcripts exist:
    | master identifier | title                                              | click through                                                       |
    | AOH1093X201106221 | Oral History Interview with Bernyce Mills DeVaughn | Boilerplate click-through                                           |
    | AOH1093X201106222 | Oral History Interview with Augustus Baxter        | Boilerplate click-through                                           |
    | AOH1093X201106223 | Oral History Interview with Mel Dorn               | Boilerplate click-through -- special clause for Mel Dorn transcript |
	When I visit the home page
  Then I should see "Welcome to the SCRC Oral Histories Repository"
	When I click on the "Search" button

Scenario: User has not yet agreed to the license agreement
	When I visit "Oral History Interview with Bernyce Mills DeVaughn"
	Then I should see "Boilerplate click-through"
	When I click on "I understand and wish to continue"
	Then I should see the "Oral History Interview with Bernyce Mills DeVaughn" oral history page

Scenario: User does not agree to the license agreement
	When I visit "Oral History Interview with Bernyce Mills DeVaughn"
	Then I should see license "Boilerplate click-through"
	When I click on "I do not agree to the Terms of Use"
	Then I should not see the "Oral Hhistory Interview with Bernyce Mills DeVaughn" oral history page
	And I should see the Oral History search results page
	And I should see an entry for "Bernyce Mills Devaugh"
	And I should see an entry for "Augustus Baxter"
	And I should see an entry for "Mel Dorn"

Scenario: User has already agreed to the same license agreement
	When I visit "Oral History Interview with Bernyce Mills DeVaughn"
	Then I should see license "Boilerplate click-through"
	When I click on "I understand and wish to continue"
	Then I should see the "Oral history interview with Bernyce Mills DeVaughn" oral history page
	When I click on the "Search" button
	And I visit "Oral History Interview with Augustus Baxter"
	Then I should not see license "Boilerplate click-through"
	And I should see the "Oral history interview with Augustus Baxter" oral history page

Scenario: User has already agreed to another license agreement and wants to agree to different license agreement
	When I visit "Oral History Interview with Bernyce Mills DeVaughn"
	Then I should see license "Boilerplate click-through"
	When I click on "I understand and wish to continue"
	Then I should see the "Oral history interview with Bernyce Mills DeVaughn" oral history page
	When I click on the "Search" button
	And I visit "Oral History Interview with Mel Dorn"
	Then I should see license "Boilerplate click-through statement -- special clause for Mel Dorn transcript"
	When I click on "I understand and wish to continue"
	Then I should see the "Oral history interview with Mel Dorn" oral history page
