@announce
@stubbed
Feature: save

  Scenario: save
    Given default backlog directory exists
    And the directory is a git repository
    And entry for "today" exists
    When I run `backlog save`
    Then project should be committed to git with proper message


