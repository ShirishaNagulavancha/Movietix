@ticketPurchasing
Feature: Ticket Purchasing

  As a movietix visitor
  I want to purchase tickets for movietix showtimes
  So that I don't have to purchase at theater


  Scenario: purchasing tickets through movies page with intially unauthenicated
    Given I am not logged in
    When  I select a showtime to go to through the movie list
    And   I log in to purchase tickets
    And   I purchase some tickets
    Then  I get a purchase confirmation
    And   I can see my purchase on the account page

  Scenario: purchasing tickets through theaters page when initially unautheniticated
    Given I am not logged in
    When I select a showtime to go to through the theater list
    And I log in to purchase tickets
    And I purchase some tickets
    Then I get a purchase confirmation
    And I can see my purchase on the account page

  Scenario:  purchasing tickets through movies page starting off authenticated
    Given I am logged in
    When  I select a showtime to go to through the movie list
    And   I purchase some tickets
    Then  I get a purchase confirmation
    And   I can see my purchase on the account page
