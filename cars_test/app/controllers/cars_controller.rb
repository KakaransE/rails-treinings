class CarsController < ApplicationController

    def index
    end

    def search
        @search_string = params.inspect
    end

    def list
        @cars = Car.all
    end

end
