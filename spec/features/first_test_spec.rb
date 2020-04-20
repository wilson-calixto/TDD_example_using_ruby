
require "rails_helper"

require 'uri'
require 'net/http'
require 'openssl'

BASE_URL = "https://www.google.com.br/"



def do_request(resource)

  url = URI(BASE_URL+resource)    
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(url)
  response = http.request(request)

  return response
end


RSpec.feature "Testing" do
  scenario "Checking if everything is working" do

    resource = "/search?q=google&oq=go&aqs=chrome.1.69i57j0l2j69i60l3.1467j0j7&sourceid=chrome&ie=UTF-8"
   
    response = do_request(resource)        
    puts response.read_body

    expect(true).to eq(true)
  end
end
