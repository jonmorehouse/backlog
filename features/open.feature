@announce
Feature: open

  Scenario: no argument passed in
    Given default backlog directory exists
    When I run `backlog`
    Then today's entry should be opened
  
  Scenario: another date passed
    Given default backlog directory exists
    When I run `backlog tomorrow`
    Then tomorrow's entry should be opened
  
  Scenario: another date passed
    Given default backlog directory exists
    When I run `backlog next tuesday`



