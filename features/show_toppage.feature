Feature: show toppage
  In order to use website
  User wants to show toppage

  Scenario: Show toppage
    When I go to the homepage
    Then I should see "Rails"
