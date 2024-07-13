Feature: To create a new counter

Background: 
    Given the app is running
    And the app has 2 counters
    And I visit {'/counters'}

  After:
    Then clean up

Scenario: The user must be authenticated
    Given I am logged in as {'Mr.Bean'}
    And I see {'2 Counters'}
    When I tap {Icons.add} icon
    Then I see {'Add New Counter'}

    When I fill in {'counter name'} with {'New Counter'}
    And I fill in {'counter value'} with  {'100'} 
    And I tap the {'Add Counter'} button
    
    Then I see {'3 Counters'}
    And I see {'100'}

    When I double tap {'New Counter'}
    Then I see {'New Counter'}
    Then I see {'Created by'}
    Then I see {'Mr.Bean'}

Scenario: The guest user is redirected first to login
  Given I am not logged in
  When I tap {Icons.add} icon
  Then I am redirected to the login page
  When I fill in {'username'} with {'user'}
  And I fill in {'password'} with {'password123'}
  And I tap the {'Login'} button
  Then I am redirected to the {'/counters/new'} page
  When I fill in {'counter name'} with {'New Counter'}
  And I fill in {'counter value'} with  {'100'} 
  And I tap the {'Add Counter'} button
  Then I see {'3 Counters'}
  And I see {'New Counter'}
  And I see {'100'}

@skip
Scenario: The guest user can go back to the home page after failed logins
  Given I am not logged in
  When I tap {Icons.add} icon
  Then I am redirected to the login page
  When I fill in {'username'} with {'wrongUser'}
  And I fill in {'password'} with {'wrongPassword'}
  And I tap the {'Login'} button
  And I tap the 'Back' button
  And I am redirected to the {'/counters'} page
  And I see {'2 Counters'}

