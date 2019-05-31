class WeatherController < ApplicationController
    require 'open_weather'
    require 'json'
    require 'date'

    def index
       #API_key: `7061597a663b65c93c451d397754049f`
        options = { units: "metric", APPID: '7061597a663b65c93c451d397754049f' } 
        @current_weather = OpenWeather::Current.city("Brooklyn, NY", options)
        @current_time = Time.now
        @lat = @current_weather["coord"]["lat"]
        @lon = @current_weather["coord"]["lon"]
        @icon = @current_weather["weather"][0]["icon"]
        @description = @current_weather["weather"][0]["description"]
        @description_icon_link = "http://openweathermap.org/img/w/#{@icon}.png"

        @five_day_forecast = OpenWeather::Forecast.city("Brooklyn, NY", options)
        @current_temp_c = @current_weather["main"]["temp"]
        @current_temp_f = ((@current_temp_c * 9/5) + 32).floor
    
        time = Time.new
        @current_unix_time = time.strftime("%s").to_i
        @same_time_tomorrow = @current_unix_time + 86400 



       # options[:list[dt]] = 
        @five_day_forecast = OpenWeather::Forecast.city("Brooklyn, NY", options)
        @list = @five_day_forecast["list"]

       #current dt  1559239652

        
    end
end
