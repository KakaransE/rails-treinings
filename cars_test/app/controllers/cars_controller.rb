class CarsController < ApplicationController

    def index
    end

    def search
        # @search_string = params.inspect for troubleshooting
        
        if params[:make].present? && params[:model].present? && params[:fuel].present?
            @list = Car.search(params)
            @average = Car.weighted_average(@list)
            @graph_data_basic = Car.graph_data_basic(@list)
            @graph_data_repeated = Car.graph_data_repeated(@list)
            @chart_max = Car.chart_max(@graph_data_basic)
            @thumbnail_url = ImageScraper.get_image(params[:make], params[:model])
        else
            
            flash.now[:danger] = "Jāaizpilda visi lauciņi!"
            render 'index'
            
        end

    end

    def list
        @cars = Car.all
    end

end
