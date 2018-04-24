Feature: movie browsing
  As a movietix visitor
  I want to be able to browse through the movies currently playing
  So that I know what movies I am able to go see
  Background: User is not logged in
    Given I am not authenticated

  Scenario: User can visit the movies from any page
    * I can visit the movies from any page

  Scenario: user sees a list of movies on the movies page
    When I go to the movies page
    Then I see a list of all movies now playing

    Scenario Outline: visiting movies from any page (ouline)
      * I can visit the movies page from the <page_name> page

      Examples:
      | page_name|
      | Theaters |
      | Login    |

      Scenario: visiting movies from any page
        * I can visit the movies from these pages:
        |Theaters|
        |Login   |

        Scenario: movies are alphabetically sorted
          Given I go to the movies page
          Then I see a list of movies ordered alphabetically
