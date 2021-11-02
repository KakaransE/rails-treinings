class CarsController < ApplicationController

    def index
    end

    def search
        @search_string = params.inspect

        if params[:make].present? && params[:model].present? && params[:fuel].present?
            @list = Car.search(params)
            @average = Car.weighted_average(@list)
            @scores_basic = Car.scores_basic(@list)
            @scores_repeated = Car.scores_repeated(@list)
        else
            
            flash.now[:danger] = "Jāaizpilda visi lauciņi!"
            render 'index'
            
        end

    end

    def list
        @cars = Car.all
    end

end
