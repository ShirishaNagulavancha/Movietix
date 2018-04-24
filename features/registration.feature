@Registration
Feature: User Registration


  Scenario: I try to register for movietix website
    Given I am not logged in
    When I can able to register successfully
    Then I am on the account page
