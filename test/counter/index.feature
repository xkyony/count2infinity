Feature: The user can   
  Background: 
    Given the app is running
    And the app has 2 counters
    And I visit {'/counters'}

  After:
    Then clean up

  Scenario: display the counters in a table
    Then I see {'Name'}
    Then I see {'Value'}
    Then I see multiple {DataTable} widgets
    Then I see {'2 Counters'}
    Then I see {'Current Counter'}

  Scenario: go to see the counter details
    Then I double tap {'Current Counter'}
    And I see {'Minimum'}
    And I see {'Maximum'}

  Scenario: add a new counter
    Given I see {'2 Counters'}
    When I tap {Icons.add} icon
    Then I see {'Add New Counter'}

    When I fill in {'counter name'} with {'New Counter'}
    And I fill in {'initial value'} with  {'100'} 
    And I tap the {'Add Counter'} button
    
    Then I see {'3 Counters'}
    And I see {'New Counter'}
    And I see {'100'}

