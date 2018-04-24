require_relative 'base_page'

class Account < BasePage
  def initialize_page
    should_contain_text 'This is your account'
    end
end