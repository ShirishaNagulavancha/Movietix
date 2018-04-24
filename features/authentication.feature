Feature: User Authentication
  # description can be here

  Background: User is not logged in
    Given I am not logged in

   Scenario: user goes directly to login page and logs in successfully
     * I can successfully log in with valid credentials

     Scenario: User tries to authenticate with invalid credentials
       When I try to log in with invalid credentials
       Then I see an authentication error message
       And I am on the login page
