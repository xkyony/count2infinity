Feature: Counter creation

  As an authenticated user 
  I want to create counters
  So that I can track additional items or events

Background: 
  Given the app is running
  And the app has 2 counters
  And I visit {'/counters'}
After:
  Then clean up

Scenario: succeeds for authenticated users
  Given I am logged in as {'Mr.Bean'}
  And I see {'2 Counters'}
  When I tap {Icons.add} icon
  Then I see {'Add Counter'}
  When I fill in {'counter name'} with {'New Counter'}
  And I fill in {'counter value'} with {'100'} 
  And I tap the {'Add Counter'} button
  Then I see {'3 Counters'}
  And I see {'100'}
  When I double tap {'New Counter'}
  Then I see {'New Counter'}
  And I see {'Created by'}
  And I see {'Mr.Bean'}

Scenario: redirects unauthenticated users to login
  Given I am not logged in
  When I tap {Icons.add} icon
  Then I am redirected to the {'/users/sign_in'} page
  
  When I succeed to login with {'mrbean@hari.co'} email and {'Qu1rkY'} password
  Then I am logged in as {'Mr.Bean'}
  And I am redirected to the {'/counters/new'} page

Scenario: allows guests to return home after failed login
  Given I am not logged in
  When I tap {Icons.add} icon
  Then I am redirected to the {'/users/sign_in'} page

  When I fail to login with {'wrong@user.co'} email and {'bad'} password
  And I go back
  Then I am redirected to the {'/counters'} page
  And I see {'2 Counters'}

