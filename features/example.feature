# encode: utf-8
Feature: Basic example of the cucumber + capybara

This example aims to demonstrate the basic use of cucumber with capybara

  Background:
    Given I'm on the page "example.html"
      And formulary was cleaned

  Scenario: Save a user
    Given a user with name "Mauricio"
      And email "mauricioadlima@gmail.com"
      And phone "+55199999999999"
      And gender "Male"

     When I click in save button
     Then message should be "Are you sure?"
      And if I click on OK option
     Then message should be "Saved with successfully!"

  Scenario: Save a user (using table)
    Given a list of users
      | Mauricio    | mauricioadlima@gmail.com | +55199999999999 | Male   |
      | dilma       | dilma@gmail.com          | +55199999999999 | Female |
      | Luiz Inacio | lula@gmail.com           | +55199999999999 | Male   |
     Then I save the user

  Scenario Outline: Save multiple users
    Given a user with name "<name>"
      And email "<email>"
      And phone "<phone>"
     Then I save the user

    Examples:
      | name        | email                    | phone           | gender |
      | Mauricio    | mauricioadlima@gmail.com | +55199999999999 | Male   |
      | dilma       | dilma@gmail.com          | +55199999999999 | Female |
      | Luiz Inacio | lula@gmail.com           | +55199999999999 | Male   |
