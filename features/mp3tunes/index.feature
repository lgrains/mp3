Feature: As a user
  I want to view all mp3tunes
  So that I can view, add and remove tunes


  Background:
    Given the following mp3tunes exist:
      |url                    |title                 | artist             | length  |
      | www.example.com/tune1 | Bingo was his name   | Tom Dooley         | 280     |
      | www.example.com/tune2 | Jumping Jacks        | Barb Jones         | 214     |
      | www.example.com/tune3 | Love is              | Maribel Hartmann   | 189     |
      | www.example.com/tune4 | My toaster is black  | Fletcher McDermott | 120     |
      | www.example.com/tune5 | Minute Waltz         | Fredrick Chopin    |  60     |
      | www.example.com/tune6 | Hip Hop Hurray       | Eve Martin         | 150     |
      | www.example.com/tune7 | Dolore Magnificat    | Chesley Stehr      | 1800    |

  Scenario: users can view tunes index page
    When I go to the Mp3tunes Index Page
    Then I should see all my mp3tunes

  Scenario: users can view ratings of tunes on the index page
    Given the following ratings exist:
      | title              |value  |
      |Bingo was his name   | 3     |
      |Bingo was his name   | 4     |
      |Bingo was his name   | 4     |
      |Bingo was his name   | 4     |
      |Bingo was his name   | 2     |
      |Bingo was his name   | 4     |
      | My toaster is black | 2     |
      | My toaster is black | 2     |
      | My toaster is black | 1     |
      | Hip Hop Hurray      | 4     |
    When I go to the Mp3tunes Index Page
    Then I should see a rating of "3.50" for "Bingo was his name"
    And I should see a rating of "1.67" for "My toaster is black"
    And I should see a rating of "4.00" for "Hip Hop Hurray"



