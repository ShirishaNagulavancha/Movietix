And(/^I am on My account page$/) do
  @current_page.wait_until(5) {
    @current_page.text.include? 'This is your account'
  }
end

Then(/^I see an authentication error message$/) do
  @current_page.wait_until(5) {
    @current_page.text.include? 'Sorry, we were not able to find a user with that username and password'
  }
end

Given(/^I am not (?:logged in|authenticated)$/) do
  on BasePage do |page|
    page.log_out if page.log_out?
  end
end

When(/^I can successfully log in with valid credentials$/) do
  visit(Login).log_in_with @username, 'P4ssw0rd'
  @current_page.should_contain_text 'Welcome'
end
When(/^I try to log in with invalid credentials$/) do
  #visit_page Login do |login_page|
  # login_page.log_in_with 'user1','bad password'
  visit(Login).log_in_with @username, 'bad password'
end

And(/^I log in to purchase tickets$/) do
  on(ShowtimeInfo).visit_login_page
  on(Login).log_in_with 'user1','P4ssw0rd'
end

Given(/^I am logged in$/) do
  visit(Login).log_in_with 'user1','P4ssw0rd' unless authenticated?
end