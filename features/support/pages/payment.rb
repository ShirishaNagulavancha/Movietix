require_relative 'base_page'

class Payment < BasePage

  link(:start_payment_entry, :visible_text => 'Purchase Tix')
  text_field(:name, id: 'name')
  text_field(:cc_number, id: 'cc_number')
  select_list(:date_month, id: 'date_month')
  select_list(:date_year, id:'date_year')
  text_field(:street_address, id:'street_address')
  text_field(:city, id:'city')
  text_field(:state, id:'state')
  text_field(:zip, id: 'zip')
  button(:complete_ticket_purchase, id: 'commit')


  def submit_payment_information(name, cc_number, date_month, date_year, street_address, city, state, zip)
    start_payment_entry
    self.name = name
    self.cc_number = cc_number
    self.date_month = date_month
    self.date_year = date_year
    self.street_address = street_address
    self.city = city
    self.state = state
    self.zip = zip
    complete_ticket_purchase
  end
end