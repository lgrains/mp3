module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the Home\s?Page/
      '/'
    when /the Mp3tunes Index Page/
      mp3tunes_path
    when /the Create Mp3tune page/
      new_mp3tune_path
    when /the Mp3tunes Show Page for mp3 "(.+)"/
      mp3tune_path(Mp3tune.find_by_title($1))
    when /the New Ratings page for "(.+)"/
      new_mp3tune_rating_path(Mp3tune.find_by_title($1))
    when /the New Playlists Page/
      new_playlist_path
    when /the Playlists Index Page/
      playlists_path



    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
