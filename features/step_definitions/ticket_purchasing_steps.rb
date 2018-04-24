And(/^I purchase some tickets$/) do
  on(BuyTickets).start_purchase
  @number_of_tickets = 3
  on(TicketEntry).enter_number_of_tickets @number_of_tickets
  on(Payment).submit_payment_information 'Siri', '1234','May','2020', '5555 glendon ct', 'dublin','ohio','43016'
end

Then(/^I get a purchase confirmation$/) do
  @current_page.should_contain_text 'You got tix!'
end

And(/^I can see my purchase on the account page$/) do
  @current_page.view_account
  on(Account).should_contain_text "#{@number_of_tickets} to"
end