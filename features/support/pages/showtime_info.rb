require_relative 'base_page'
class ShowtimeInfo < BasePage

  link(:visit_login_page, text:'Log in to buy tix')
  def initialize_page
    should_contain_text 'Showtime info'
  end
end