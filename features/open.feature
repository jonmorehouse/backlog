@announce
Feature: open

  Scenario: no argument passed in
    Given default backlog directory exists
    When I run `backlog`
    Then today's entry should be opened

  #Scenario: string date passed in
    #Given default backlog directory exists
    #When I run `backlog today`


  #Scenario: invalid date passed in
  



