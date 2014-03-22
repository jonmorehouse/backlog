@announce
Feature: help

  Scenario: help shortcut 
    When I run `backlog h`
    Then the help dialog should appear

  #Scenario: help

    #When I run `backlog help`
    #Then the help dialog should appear




