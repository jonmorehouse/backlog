@announce
@stubbed
Feature: archive

  Scenario: all
    Given default backlog directory exists
    Given entry for "yesterday" exists
    When I run `backlog archive`
    Then entry for "yesterday" should be archived

  Scenario: specific date
    Given default backlog directory exists
    Given entry for "yesterday" exists
    Given entry for "last tuesday" exists
    When I run `backlog archive yesterday`
    Then entry for "yesterday" should be archived
    And entry for "last tuesday" should not be archived


