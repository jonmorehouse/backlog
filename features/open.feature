@announce
@stubbed
Feature: open

  Scenario: no argument passed in
    Given default backlog directory exists
    When I run `backlog`
    Then "today" should be opened
    And "today" should be a backlog entry
    And "today" is saved
  
  Scenario: another date passed
    Given default backlog directory exists
    When I run `backlog tomorrow`
    Then "tomorrow" should be opened
    And "tomorrow" should be a backlog entry
    And "tomorrow" is saved
  
  Scenario: another date passed
    Given default backlog directory exists
    When I run `backlog next tuesday`
    Then "next tuesday" should be opened
    And "next tuesday" should be a backlog entry
    And "next tuesday" is saved

