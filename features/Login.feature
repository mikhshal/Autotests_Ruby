@Login
Feature: Login into SWC

  Scenario: Verify that user can login in SWC
    Given User on login page
    Then User inputs the Email and Password and press Login
    Then User on the Deals page

