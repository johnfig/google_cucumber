module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition
  #
  
  SERVER ||= 'http://www.google.com'

  def path_to(page_name)
    case page_name
    
    when /^the advanced search page/
      SERVER + '/advanced_search'

    when /^the merchant signup page/
       'www.matrix.gopago.com/merchant_signup'

    else
      if path = match_rails_path_for(page_name) 
        path
      else 
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
      end
    end
  end
end

World(NavigationHelpers)
