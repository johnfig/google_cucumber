@javascript
@selenium

Feature: Google Advanced Search Page

Background: User is on google advanced search page
  Given I am on the advanced search page
  And I maximize the browser
  Then I wait "2" seconds

Scenario: Use the google drop down menu
	And I click "lr_button" input
 	Then I wait "2" seconds