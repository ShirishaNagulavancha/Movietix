require_relative 'base_page'

class Registration < BasePage
  include PageObject
direct_url(BASE_URL + 'user/create')
  text_field(:user, id: 'username')
  text_field(:password, id: 'password')
  button(:finish_registration, name: 'commit')

  def initialize_page
    user_element.when_present 5
  end

  def complete_registration_with(user, password)
    self.user = user
    self.password = password
    finish_registration
  end
end