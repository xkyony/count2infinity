Feature: The user can  
  Background: 
    Given the app is running
    And the app has 2 counters
    And I visit {'/counters/current'}

  After:
    Then clean up

  Scenario: see the initial value
    Then I see the counter value is {'0'}

  Scenario: increment the counter
    When I tap the increment button 
    Then I see the counter value is {'1'}

  Scenario: decrement the counter
    When I tap the decrement button
    Then I see the counter value is {'-1'}

  Scenario: reset the counter
    When I tap the reset button
    Then I see the counter value is  {'0'}
  
  Scenario: save to and retrieve from local storage 
    Given  I increment the counter {5} times
    Then I see the counter value is {'5'}
    And I save the counter
    And I increment the counter {2} times
    Then I see the counter value is {'7'}
    When I retrieve the saved counter value 
    Then I see the counter value is {'5'}

  Scenario: display the timestamp of when the counter value was saved
    Given I increment the counter {5} times
    And I save the current counter value at {'2024-03-05 13:30'}
    And I decrement the counter {2} times
    When I retrieve the saved counter value
    Then I see the counter value is {'5'}
    And the counter time contains {'13:30'}

  Scenario: sync the counter in realtime with external database
    Given  I increment the counter {5} times
    And I see the counter value is {'5'}
    Then the database has counter value {5}

    When I decrement the counter {2} times
    And I see the counter value is {'3'}
    Then the database has counter value {3}

    When I tap the reset button
    And I see the counter value is {'0'}
    And the database has counter value {0}
    
  Scenario: sync in realtime after saving to local storage
    Given  I increment the counter {5} times
    And I save the current counter value
    And I decrement the counter {2} times
    When I retrieve the saved counter value
    Then the database has counter value {5}

  Scenario: track the max value
    When I increment the counter {5} times
    And I see the counter value is {'5'}
    Then I see the counter max value {'5'}

    When I decrement the counter {2} times
    And I see the counter value is {'3'}
    Then I see the counter max value {'5'}

    When I reset the counter
    And I see the counter value is {'0'}
    Then I see the counter max value {'5'}

    When I decrement the counter {7} times
    And I see the counter value is {'-7'}
    Then I see the counter max value {'5'}

    When I increment the counter {17} times
    And I see the counter value is {'10'}
    Then I see the counter max value {'10'}

  Scenario: track the min value
    When I increment the counter {5} times
    And I see the counter value is {'5'}
    Then I see the counter min value {'0'}

    When I decrement the counter {7} times
    And I see the counter value is {'-2'}
    Then I see the counter min value {'-2'}

    When I reset the counter
    And I see the counter value is {'0'}
    Then I see the counter min value {'-2'}

    When I decrement the counter {5} times
    And I see the counter value is {'-5'}
    Then I see the counter min value {'-5'}

    When I increment the counter {17} times
    And I see the counter value is {'12'}
    Then I see the counter min value {'-5'}



