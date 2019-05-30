class WeatherController < ApplicationController
    require 'open_weather'

    def index
       #API_key: `7061597a663b65c93c451d397754049f`
        options = { units: "metric", APPID: '7061597a663b65c93c451d397754049f' } 
        @result = OpenWeather::Current.city("Brooklyn, NY", options)
    end
end
