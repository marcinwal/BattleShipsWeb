Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

  Scenario: Empty Name
    Given I am on the newgame page
    When name is empty
    Then i should see "Please go back"

  Scenario: Two Players are registered
    Given I am on the newgame page
    When Two Players are registered
    When I am on the toolate page
    Then I should see "We are sorry"

  Scenario: Two Players are ready to play
    Given I am on the game page
    When Two Players are registered
    Then I should see "Welcome to the game"
