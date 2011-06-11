Feature: As I user
  I want to rate a tune
  So that people will know how popular it is

  Background:
    Given the following mp3tunes exist:
      |url                    |title                 | artist             | length  |
      | www.example.com/tune1 | Bingo was his name   | Tom Dooley         | 280     |


    Scenario: user rates a tune without any ratings yet
      Given I am on the Mp3tunes Index Page
      Then I should see "N/R"
      When I follow "Rate this tune"
      Then I should be on the New Ratings page for "Bingo was his name"
      When I select "I can take it or leave it" from "rating_value"
      And I press "Save"
      Then I should be on the Mp3tunes Index Page
      And I should see "3.00"

    Scenario: user rates a tune with many ratings
      Given mp3tune "Bingo was his name" has ratings with values "3,4,5,4,2,3,4,5"
      And I am on the Mp3tunes Index Page
      When I follow "Rate this tune"
      Then I should be on the New Ratings page for "Bingo was his name"
      When I select "Best Tune Ever" from "rating_value"
      And I press "Save"
      Then I should be on the Mp3tunes Index Page
      And I should see "3.89"

