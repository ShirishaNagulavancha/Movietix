require_relative 'base_page'

class Login < BasePage
  include PageObject
  #ruby doesn't force you to pass all the arguements
  direct_url(BASE_URL + 'login')
  text_field(:username, id:'username')
  text_field(:password , id:'password')
  button(:submit_credentials, name:'commit')

  def initialize_page  # to check this is your login page
    #wait_until(5, 'Login page failed to load'){
     # username?
      #}
    username_element.when_present 5
  end
  def log_in_with(username, password)
    self.username = username  #self is similar to this in java
    self.password = password
    submit_credentials
  end
end