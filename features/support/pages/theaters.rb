require_relative 'base_page'
class Theaters < BasePage
  direct_url(BASE_URL + 'theater/listAll')
  div(:theaters_list, id:'theaters_accordion')
  h3(:first_theater, id: 'theater_heading_1')
  link(:view_theater_showtimes, id: 'theater_showtimes_1')

  def initialize_page
    theaters_list_element.when_present 5
  end
   def view_first_theater_showtimes
     first_theater_element.click
     view_theater_showtimes


   end
end