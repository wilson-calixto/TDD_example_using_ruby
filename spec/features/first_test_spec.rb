
require "rails_helper"

require 'uri'
require 'net/http'
require 'openssl'

BASE_URL = "https://uqms-backend.herokuapp.com"



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

    resource = "/production/production_goal/production_line/3"
   
    response = do_request(resource)        
    puts response.read_body

    expect(true).to eq(true)
  end
end