@announce
@stubbed
Feature: open
  
  Scenario: git remote set

    Given default backlog directory exists
    Given entry for "yesterday" exists
    And entry for "today" exists
    When I run `backlog push`
    Then the git repository should be pushed

  Scenario: git remote not set

    Given default backlog directory exists
    Given entry for "yesterday" exists
    And entry for "today" exists
    When I run `backlog push`
    Then the git repository should not be pushed



