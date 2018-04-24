require_relative 'base_page'

class TheaterShowTimes < BasePage
  link(:select_first_showtimes, id: 'showtime_1_1')


end