Feature: Authentication

  Scenario: Log in user
    Given I have a user with email address "adamjamesleonard@gmail.com"
    When I go to the sign in page
    And I fill in "user_email" with "adamjamesleonard@gmail.com"
    And I fill in "user_password" with "password"
    And I press "Sign in"
    Then show me the page
    Then I should see "Successfully signed in!"