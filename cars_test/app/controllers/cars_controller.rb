class CarsController < ApplicationController

    def index
    end

    def search
        @search_string = params.inspect

        if params[:make].present? && params[:model].present? && params[:fuel].present?
            @list = Car.search(params)
        else
            
            flash.alert = "Jāaizpilda visi lauciņi!"
            render 'index'
            
        end

    end

    def list
        @cars = Car.all
    end

end
