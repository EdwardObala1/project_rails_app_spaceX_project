class HomeController < ApplicationController

  def index
  end


  def launches
    require 'uri'
    require 'net/http'
    require 'json'


    if @data == nil
      url = 'https://api.spacexdata.com/v3/launches'
      url = URI(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)
      request['Content-type'] = 'application/json'
      response = http.request(request)
    end
    if response.code == "200"
      @data ||= JSON.parse(response.body)
    else
      @data = nil
    end
     # because paginate with kamari did not work I am making my own
    @items_per_page = 20
    @page_count = @data.count/@items_per_page
    @page = params[:page].to_i
    @first_item = @items_per_page * (@page - 1)
    @last_item = @items_per_page * @page
    @data
  end

  def show
  end
end

# <img src = "<%= image_tag(@data.links.mission_patch) %>">
# ["flight_number", "mission_name", "mission_id", "upcoming", 
# "launch_year", "launch_date_unix", "launch_date_utc", "launch_date_local", 
# "is_tentative", "tentative_max_precision", "tbd", "launch_window", "rocket", 
# "ships", "telemetry", "launch_site", "launch_success", "launch_failure_details", 
# "links", "details", "static_fire_date_utc", "static_fire_date_unix", "timeline", "crew"]

