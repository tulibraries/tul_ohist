Feature: Click-through agreement
Oral histories are covered by various licenses granted to Temple University
Libraries by the narrators. We need to have users agree to these licenses 
before they view oral history assets.

In order to allow users access to assets covered by a license agreement
So that we can be reasonably assured that users are cognizant of the license agreement
We want users to be able agree to a use license before they view the assets

Scenario: User has not yet agreed to the license agreement
Given context
When events
Then results

Scenario: User does not agree to the license agreement
Given context
When events
Then results

Scenario: User has already agreed to the same license agreement
Given context
When events
Then results

Scenario: User has alreayd agreed to another license agreement and wants to agree to different license agreement
Given context
When events
Then results
