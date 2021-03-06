@announce
Feature: init

  Scenario: backlog directory does not exist
    
    Given default backlog directory does not exist
    When I run `backlog init`
    Then backlog directory should exist

  Scenario: BACKLOG_DIR environment not set

    Given default backlog directory does not exist
    When I run `backlog init`
    Then backlog directory should exist

  Scenario: backlog directory exists

    Given default backlog directory exists
    When I run `backlog init`
    Then backlog directory should exist
    

