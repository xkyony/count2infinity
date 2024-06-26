Feature: Counter::
  Background: 
    Given the app is running
    # And the initial value is set to 0

  After:
    Then clean up

  Scenario: Initial value is 0
    Then I see {'0'}

  Scenario: Increment  
    When I tap the increment button 
    Then I see {'1'}

  Scenario: Decrement 
    When I tap the decrement button
    Then I see {'-1'}

  Scenario: Reset 
    When I tap the reset button
    Then I see {'0'}
  
  Scenario: Local Storage Save and retrieve
    Given  I increment the counter {5} times
    Then I see {'5'}
    And I save the current counter value
    And I increment the counter {2} times
    Then I see {'7'}
    When I retrieve the saved counter value 
    Then I see {'5'}

  Scenario: Save and display the timestamp of when the counter value was saved
    Given I increment the counter {5} times
    And I save the current counter value at {'2024-03-05 13:30'}
    And I decrement the counter {2} times
    When I retrieve the saved counter value
    Then I see {'5'}
    And I spot {'2024-03-05 13:30'} 

  Scenario: Save and sync in realtime with external database
    Given  I increment the counter {5} times
    Then I see {'5'}
    And the database has counter value {5}
    When I decrement the counter {2} times
    Then I see {'3'}
    And the database has counter value {3}
    When I tap the reset button
    Then I see {'0'}
    And the database has counter value {0}


  # Scenario: reset to zero if nothing has been saved previously
  #   Given  I tap {Icons.add} icon {5} times
  #   When I tap {Icons.restore} icon 
  #   Then I see {'0'} 




