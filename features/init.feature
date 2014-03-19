@announce
Feature: init
  Scenario: No backlog_dir environment variable set
    Given I set the environment variables to:
      |variable|value|
      |BACKLOG_DIR||
    When I run `backlog init`
    Then test
    
  #Scenario: Backlog directory already exists 
    #Given a directory named ".backlog"
    #Then test

