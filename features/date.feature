@announce
Feature: date

  Scenario Outline: invalid dates
    Given I set the date string to <string>
    When I create a date object
    Then it should not be a valid datefile
  
    Examples:
      |string|
      |"lasterday"|
      |"tomorday"|

  Scenario: today

    When I create a datefile with no date_string
    Then it should be a valid datefile
    And it should be today's date 
    And it should be a current file

  Scenario Outline: future dates
    Given I set the date string to <string>
    When I create a date object
    Then it should be a valid datefile
    And it should be a current file

    Examples:
      |string|
      |"tomorrow"|
      |"next tuesday"|
      |"next week"|



