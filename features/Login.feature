@Login
Feature: Login into SWC

  @scenario_setup
  Scenario: Verify that user can login in SWC
    Given User on login page
    Then User inputs the Email and Password
    Then User press the Login button
    Then User on the Deals page

  @scenario_setup
   Scenario: Verify that user with
     Given User on login page
     Then User inputs the incorrect set of Email and Password
     Then User press the Login button
     Then User see error User credentials do not match

