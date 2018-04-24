require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'active_support/core_ext/string/inflections'
require_relative '../../features/support/pages/base_page'

#page object is a library that allows to use page-object pattern
# page factory gives you instances of page-object

browser = Watir::Browser.new
this_file_location = File.dirname __FILE__ #this file
config_file_path = this_file_location + "/../../config/config.yml"
config = YAML.load_file config_file_path

BASE_URL = config['testApplicationUrl']
DATABASE_HOST = config[:databaseHost]
World(PageObject::PageFactory)

module CustomWorld
  def authenticated?
    authenticated = false
    if @current_page
      authenticated = @current_page.text.include? 'Welcome'
    else
      authenticated = on(BasePage).text.include? 'Welcome'
    end
    authenticated
  end
end

#adding page object to cucumber's world
# World is super class of all classes in Ruby and all objects are instances of it
World(CustomWorld)

random_value = Random.new
test_suffix = random_value.rand(10000..99999)

# this is a hook


Before do
  @registeruser = "user#{test_suffix}"
  @username = 'user1'
   @browser = browser
end
