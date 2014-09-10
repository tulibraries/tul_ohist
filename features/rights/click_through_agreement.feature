Feature: Click-through agreement
Oral histories are covered by various licenses granted to Temple University
Libraries by the narrators. We need to have users agree to these licenses 
before they view oral history assets.

In order to allow users access to assets covered by a license agreement
So that we can be reasonably assured that users are cognizant of the license agreement
We want users to be able agree to a use license before they view the assets

Background:
	Given we have an oral history with the title "Oral History Interview with Bernyce Mills DeVaughn"
	And the oral history has the click through agreement "Boilerplate click-through"
	And we have an oral history with the title "Oral history interview with Augustus Baxter"
	And the oral history has the click through agreement "Boilerplate click-through"
	And we have an oral history with the title "Oral history interview with Mel Dorn"
	And the oral history has the click through agreement "Boilerplate click-through statement -- special clause for Mel Dorn transcript"
	When I visit the home page
	And I click on the "Search" button

Scenario: User has not yet agreed to the license agreement
	When I click on "Oral history interview with Bernyce Mills DeVaughn"
	Then I should see "Boilerplate click-through"
	When I click on "I understand and wish to continue"
	Then I should see the "Oral history interview with Bernyce Mills DeVaughn" oral history page

Scenario: User does not agree to the license agreement
	When I click on "Oral history interview with Bernyce Mills DeVaughn"
	Then I should see "Boilerplate click-through"
	When I click on "I do not agree to the Terms of Use"
	Then I should not see the "Oral history interview with Bernyce Mills DeVaughn" oral history page
	And I should see the Oral History search results page
	And I should see an entry for "Bernyce Mills Devaugh"
	And I should see an entry for "Augustus Baxter"
	And I should see an entry for "Mel Dorn"

Scenario: User has already agreed to the same license agreement
	When I click on "Oral history interview with Bernyce Mills DeVaughn"
	Then I should see "Boilerplate click-through"
	When I click on "I understand and wish to continue"
	Then I should see the "Oral history interview with Bernyce Mills DeVaughn" oral history page
	When I click on the "Search" button
	And I click on "Oral history interview with Augustus Baxter"
	Then I should not see "Boilerplate click-through"
	And I should see the "Oral history interview with Augustus Baxter" oral history page

Scenario: User has already agreed to another license agreement and wants to agree to different license agreement
	When I click on "Oral history interview with Bernyce Mills DeVaughn"
	Then I should see "Boilerplate click-through"
	When I click on "I understand and wish to continue"
	Then I should see the "Oral history interview with Bernyce Mills DeVaughn" oral history page
	When I click on the "Search" button
	And I click on "Oral history interview with Mel Dorn"
	Then I should see "Boilerplate click-through statement -- special clause for Mel Dorn transcript"
	When I click on "I understand and wish to continue"
	Then I should see the "Oral history interview with Mel Dorn" oral history page
