class WeatherController < ApplicationController
    require 'open_weather'
    require 'json'
    require 'date'

    def index
       #API_key: `7061597a663b65c93c451d397754049f`
        options = { units: "metric", APPID: '7061597a663b65c93c451d397754049f' } 
        @current_weather = OpenWeather::Current.city("Brooklyn, NY", options)
        @lat = @current_weather["coord"]["lat"]
        @lon = @current_weather["coord"]["lon"]
        @icon = @current_weather["weather"][0]["icon"]
        @description = @current_weather["weather"][0]["description"]
        @description_icon_link = "http://openweathermap.org/img/w/#{@icon}.png"

        @time = Time.new
        @unixtime = @time.strftime("Unix time is %s")

       # options[:list[dt]] = 
        @five_day_forecast = OpenWeather::Forecast.city("Brooklyn, NY", options)

       #current dt  1559239652

        
    end
end
