When(/^I can able to register successfully$/) do
  visit(Registration).complete_registration_with @registeruser, 'Password1'
  # User.All.each do |username|
  #   expect(@registeruser).to eql
  # end
  end
