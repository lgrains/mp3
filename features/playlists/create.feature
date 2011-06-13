Feature:  As a user,
  I want to create a playlist
  So that I can listen to my tunes

  Background:
     Given the following mp3tunes exist:
        |url                    |title                 | artist             | length  |
        | www.example.com/tune1 | Bingo was his name   | Tom Dooley         | 280     |
        | www.example.com/tune2 | Jumping Jacks        | Barb Jones         | 214     |
        | www.example.com/tune3 | Love is              | Maribel Hartmann   | 189     |
        | www.example.com/tune4 | My toaster is black  | Tom Dooley         | 120     |
        | www.example.com/tune5 | Minute Waltz         | Fredrick Chopin    |  60     |
        | www.example.com/tune6 | Hip Hop Hurray       | Eve Martin         | 150     |
        | www.example.com/tune7 | Dolore Magnificat    | Chesley Stehr      | 1800    |

    And the mp3tunes have the following ratings:
        |  title              | rating  |
        | Bingo was his name  | 3 |
        | Jumping Jacks       | 4 |
        | Love is             | 2 |
        | My toaster is black | 3 |
        | Hip Hop Hurray      | 1 |
        | Dolore Magnificat   | 5 |

    Scenario:  user prepares a playlist of all tunes in random order
      Given I am on the New Playlists Page
      And I press "Create Playlist"
      Then I should be on the Playlists Index Page
      Then I should see the lines "#EXTM3U;EXTINF:280,Tom Dooley - Bingo was his name;www.example.com/tune1;EXTINF:214,Barb Jones - Jumping Jacks;www.example.com/tune2;EXTINF:189,Maribel Hartmann - Love is;www.example.com/tune3;EXTINF:120,Tom Dooley - My toaster is black;www.example.com/tune4;EXTINF:60,Fredrick Chopin - Minute Waltz;www.example.com/tune5;EXTINF:150,Eve Martin - Hip Hop Hurray;www.example.com/tune6;EXTINF:1800,Chesley Stehr - Dolore Magnificat;www.example.com/tune7" in the playlist

    Scenario: user prepares a playlist of tunes from specific artist
      Given I am on the New Playlists Page
      And I check "artist_name"
      And I select "Tom Dooley" from "artist"
      And I press "Create Playlist"
      Then I should be on the Playlists Index Page
      And I should see the lines "#EXTM3U;EXTINF:280,Tom Dooley - Bingo was his name;www.example.com/tune1;EXTINF:120,Tom Dooley - My toaster is black;www.example.com/tune4" in the playlist
      Then I should not see the lines "#EXTINF:214,Barb Jones - Jumping Jacks;www.example.com/tune2;EXTINF:189,Maribel Hartmann - Love is;www.example.com/tune3;EXTINF:60,Fredrick Chopin - Minute Waltz;www.example.com/tune5;EXTINF:150,Eve Martin - Hip Hop Hurray;www.example.com/tune6;EXTINF:1800,Chesley Stehr - Dolore Magnificat;www.example.com/tune7" in the playlist

    Scenario: user prepares a playlist of tunes from a specified minimum rating
      Given I am on the New Playlists Page
      And I check "minimum_rating"
      And I select "2" from "min_rating"
      And I press "Create Playlist"
      Then I should be on the Playlists Index Page
      Then I should see the lines "#EXTM3U;EXTINF:280,Tom Dooley - Bingo was his name;www.example.com/tune1;EXTINF:214,Barb Jones - Jumping Jacks;www.example.com/tune2;EXTINF:189,Maribel Hartmann - Love is;www.example.com/tune3;EXTINF:120,Tom Dooley - My toaster is black;www.example.com/tune4;EXTINF:1800,Chesley Stehr - Dolore Magnificat;www.example.com/tune7" in the playlist
      And I should not see the lines "EXTINF:150,Eve Martin - Hip Hop Hurray;www.example.com/tune6;EXTINF:60,Fredrick Chopin - Minute Waltz;www.example.com/tune5" in the playlist

    Scenario: user prepares a playlist of tunes with specific artist or specified minimum rating
      Given I am on the New Playlists Page
      And I check "artist_name"
      And I select "Tom Dooley" from "artist"
      And I check "minimum_rating"
      And I select "4" from "min_rating"
      And I press "Create Playlist"
      Then I should be on the Playlists Index Page
      And I should see the lines "#EXTM3U;EXTINF:280,Tom Dooley - Bingo was his name;www.example.com/tune1;EXTINF:214,Barb Jones - Jumping Jacks;www.example.com/tune2;EXTINF:120,Tom Dooley - My toaster is black;www.example.com/tune4;EXTINF:1800,Chesley Stehr - Dolore Magnificat;www.example.com/tune7" in the playlist
      And I should not see the lines "EXTINF:189,Maribel Hartmann - Love is;www.example.com/tune3;EXTINF:60,Fredrick Chopin - Minute Waltz;www.example.com/tune5;EXTINF:150,Eve Martin - Hip Hop Hurray;www.example.com/tune6" in the playlist