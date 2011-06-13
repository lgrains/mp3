Feature:  As a user
  I want to delete a tune
  So I don't have to listen to it any more

  Background:
    Given the following mp3tunes exist:
      |url                    |title                 | artist             | length  |
      | www.example.com/tune1 | Bingo was his name   | Tom Dooley         | 280     |

  Scenario: User deletes a song
    When I go to the Mp3tunes Index Page
    And I press "Remove"
    Then I should see "Mp3tune was successfully removed."
    Then the Mp3tune with title "Bingo was his name" is not in the database
    And I should not see "Bingo was his name"