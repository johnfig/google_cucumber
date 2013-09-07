@javascript
@selenium

Feature: Google Advanced Search Page

Background: User is on google advanced search page
  Given I am on the advanced search page
  And I maximize the browser
  Then I wait "2" seconds

Scenario: Test Arabic language google dropdown
	When I click "any language" dropdown
 	Then I wait "2" seconds
 	When I click "Afrikaans" google button
 	And I press "Advanced Search"
 	Then I wait "2" seconds

Scenario: Test Arabic language google dropdown
	When I click "any language" dropdown
 	Then I wait "2" seconds
 	When I click "Arabic" google button
 	And I press "Advanced Search"
 	Then I wait "2" seconds