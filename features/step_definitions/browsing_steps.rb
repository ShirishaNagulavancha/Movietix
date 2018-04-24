And(/^I am on the (.+) page$/) do |page_name|
  on(page_name.gsub(' ', '_').camelize)
end

When(/^I go to the (.+) page$/) do |page_name|
  visit(page_name.gsub(' ', '_').camelize)
end

When(/^I can visit the movies from any page$/) do
  [Login, Theaters].each do |page_name|
    visit page_name do |page|
      page.view_movies
      on Movies
    end
  end
end

When(/^I can visit theater from movies page$/) do
  [Login, Movies].each do |page_name|
    visit page_name do |page|
      page.view_theaters
      on Theaters
    end
  end
end

When(/^I select a showtime to go to through the movie list$/) do
  visit(Movies).view_first_movie_showtimes
  on(MovieShowtimes).select_first_showtime
  if authenticated?
    on(BuyTickets)
  else
    on(ShowtimeInfo)
  end

end


When(/^I select a showtime to go to through the theater list$/) do
  visit(Theaters).view_first_theater_showtimes
  on(TheaterShowTimes).select_first_showtimes
  if authenticated?
    on(BuyTickets)
  else
    on(ShowtimeInfo)
end
end

Then(/^I see a list of all movies now playing$/) do
  on(Movies) do |movies_page|
    movies_listings = movies_page.movie_list
    Movie.all.each do |movie_from_db|
      expect(movies_listings).to include movie_from_db.title
    end
  end
end

When(/^I can visit the movies page from the (.*) page$/) do |page_name|
  visit(page_name) do |page|
    page.view_movies
    on Movies
  end
end

When(/^I can visit the movies from these pages:$/) do |pages|
  pages.raw.flatten.each do |page_name|
    visit page_name do |page|
      page.view_movies
      on Movies
    end
  end
end

Then(/^I see a list of movies ordered alphabetically$/) do
  on Movies do |movies_page|
titles = movies_page.all_movies_titles
    expect(titles).to eq(titles.sort)
  end
end