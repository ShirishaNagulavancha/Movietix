After('@Registration') do
  new_user = User.find_by(username: @registeruser)
  new_user.destroy
end

After('@ticketPurchasing') do
user = User.where(username: @username).first
purchases = Purchase.where(user_id: user, number_of_tickets: @number_of_tickets)
  purchases.each do |purchase|
    showtime = Showtime.find(purchase.showtime_id)
    showtime.seats_available += @number_of_tickets
    showtime.tickets_sold -= @number_of_tickets
    showtime.save
    purchase.destroy
  end
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') unless File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^\w]/,'')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end

end
