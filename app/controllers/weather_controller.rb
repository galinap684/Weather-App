class WeatherController < ApplicationController
    require 'open_weather'
    require 'json'

    def index
       #API_key: `7061597a663b65c93c451d397754049f`
        options = { units: "metric", APPID: '7061597a663b65c93c451d397754049f' } 
        @result = OpenWeather::Current.city("Brooklyn, NY", options)
        @lat = @result["coord"]["lat"]
        @lon = @result["coord"]["lon"]
        @icon = @result["weather"][0]["icon"]
        @description = @result["weather"][0]["description"]
        @description_icon_link = `http://openweathermap.org/img/w/#{@icon}.png`


        
    end
end
