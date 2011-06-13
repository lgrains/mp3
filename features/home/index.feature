Feature:  As a user,
  I want to view the home page
  So that I can choose what to do

  Scenario: View the home page
    Given I am on the Home Page
    Then I should see "Welcome to MP3 Manager"
    When I follow "Manage your MP3 list - view, add, delete, rate your mp3s"
    Then I should be on the Mp3tunes Index Page
    When I follow "Back"
    Then I should be on the Home Page
    When I follow "Generate your Playlist"
    Then I should be on the New Playlists Page
    When I follow "Back"
    Then I should be on the Home Page

  Scenario: Navigation
    Given I am on the Home Page
    When I follow "Manage your MP3 list - view, add, delete, rate your mp3s"
    Then I should be on the Mp3tunes Index Page
    When I follow "New Mp3tune"
    Then I should be on the Create Mp3tune page
    When I follow "Back"
    Then I should be on the Mp3tunes Index Page
    When I follow "Back"
    Then I should be on the Home Page
    When I follow "Generate your Playlist"
    Then I should be on the New Playlists Page
    When I press "Create Playlist"
    Then I should be on the Playlists Index Page
    When I follow "Back"
    Then I should be on the New Playlists Page