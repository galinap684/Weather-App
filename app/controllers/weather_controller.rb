class WeatherController < ApplicationController
    require 'open_weather'
    require 'json'

    def index
       #API_key: `7061597a663b65c93c451d397754049f`
        options = { units: "metric", APPID: '7061597a663b65c93c451d397754049f' } 
        @current_weather = OpenWeather::Current.city("Brooklyn, NY", options)
        @lat = @current_weather["coord"]["lat"]
        @lon = @current_weather["coord"]["lon"]
        @icon = @current_weather["weather"][0]["icon"]
        @description = @current_weather["weather"][0]["description"]
        @description_icon_link = "http://openweathermap.org/img/w/#{@icon}.png"

        options[:cnt] = 5
        @five_day_forecast = OpenWeather::Forecast.city("Brooklyn, NY", options)



        
    end
end
