Feature: As a user
  I want to view the list of mp3tunes
  in order to add new tunes

  Background:
    Given the following mp3tunes exist:
      |url                    |title                 | artist             | length  |
      | www.example.com/tune1 | Bingo was his name   | Tom Dooley         | 280     |
      | www.example.com/tune2 | Jumping Jacks        | Barb Jones         | 214     |
      | www.example.com/tune3 | Love is              | Maribel Hartmann   | 189     |

    Scenario: submit a new tune with valid information
      When I go to the Mp3tunes Index Page
      And I follow "New Mp3tune"
      Then I should be on the Create Mp3tune page
      When I fill in "Url" with "www.tunes.com/mytunes"
      And I fill in "Title" with "Rocky Mountain High"
      And I fill in "Artist" with "John Denver"
      And I fill in "Length" with "300"
      And I press "Save"
      Then a new Mp3tune should be created in the database with title "Rocky Mountain High"
      And I should be on the Mp3tunes Show Page for mp3 "Rocky Mountain High"
      And I should see "Mp3tune was successfully created."
      And I should see the items "www.tunes.com/mytunes,Rocky Mountain High,John Denver,300"

   Scenario: submit a new tune with invalid information
    When I go to the Mp3tunes Index Page
    And I follow "New Mp3tune"
    And I press "Save"
    Then I should see "5 errors prohibited this mp3tune from being saved:"
    Then I should see "Url can't be blank"
    And I should see "Title can't be blank"
    And I should see "Artist can't be blank"
    And I should see "Length can't be blank"
    And I should see "Length is not a number"