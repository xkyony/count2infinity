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

  Scenario: delete a counter
    Given I see {'2 Counters'}
    And I see {'To be deleted counter'}
    When  I tap the deleted button for {'To be deleted counter'}
    Then I don't see {'To be deleted counter'}
    And I see {'1 Counters'}

  Scenario: edit a counter
    Given I see {'Current Counter'}
    When I tap the edit button for {'Current Counter'}
    Then I see {'Edit Counter'}

    When I fill in {'counter name'} with {'Edited Counter'}
    And I fill in {'counter value'} with {'200'}
    And I tap the {'Edit Counter'} button
    
    Then I don't see {'Current Counter'} 
    And I see {'Edited Counter'}
    And I see {'200'}
    # And I see {'2 Counters'}



