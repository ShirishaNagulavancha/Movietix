Feature: theater browsing
  As a movietix visitor
  I want to be able to browse through the movies currently playing
  So that I know what movies I am able to go see
  Background: User is not logged in
  Given I am not authenticated

  Scenario: User can visit theaters from movie page
    * I can visit theater from movies page
