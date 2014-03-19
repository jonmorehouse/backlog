@announce
Feature: date

  Scenario: invalid date

  Scenario: today

    When I create a datefile with no date_string
    Then it should be a valid datefile
    And it should be today's date 
    And it should be a current file

  Scenario: future date
    Given I set the date string to "tomorrow"
    When I create a date object
    Then it should be a valid datefile
    And it should be a current file
    




