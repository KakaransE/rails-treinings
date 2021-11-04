class CarsController < ApplicationController

    def index
    end

    # def search
    #     @search_string = params.inspect 
        
    #     if params[:make].present? && params[:model].present? && params[:fuel].present? && (params[:only_make].to_i == 0)
    #         @list = Car.search(params)
    #         @average = Car.weighted_average(@list)
    #         @graph_data_basic = Car.graph_data_basic(@list)
    #         @graph_data_repeated = Car.graph_data_repeated(@list)
    #         @chart_max = Car.chart_max(@graph_data_basic)
    #         @thumbnail_url = ImageScraper.get_image(params[:make], params[:model])
    #     else
            
    #         flash.now[:danger] = "Jāaizpilda visi lauciņi!"
    #         render 'index'
            
    #     end

    # end

    def search
        # @search_string = params.inspect # for troubleshooting

        if params[:make].present? && (params[:only_make].to_i == 1)
            @list = Car.search_make(params)
            if  @list.count == 0
                flash.now[:danger] = "Nekas netika atrasts!"
                render 'index'
            else
                params[:model] = "visi"
                params[:fuel] = "visi"
                @average = Car.weighted_average(@list)
                @graph_data_basic = Car.graph_data_basic(@list)
                @graph_data_repeated = Car.graph_data_repeated(@list)
                @chart_max = Car.chart_max(@graph_data_basic)
                @thumbnail_url = ImageScraper.get_image(params[:make], "pictures")
            end
        elsif params[:make].present? && params[:model].present? && params[:fuel].present? && (params[:only_make].to_i == 0)
            @list = Car.search(params)
            if  @list.count == 0
                flash.now[:danger] = "Nekas netika atrasts!"
                render 'index'
            else
                @average = Car.weighted_average(@list)
                @graph_data_basic = Car.graph_data_basic(@list)
                @graph_data_repeated = Car.graph_data_repeated(@list)
                @chart_max = Car.chart_max(@graph_data_basic)
                @thumbnail_url = ImageScraper.get_image(params[:make], params[:model])
            end
        else
            
            flash.now[:danger] = "Jāaizpilda visi atlases kritēriju lauki, vai jāievada auto ražotājs un jāatzīmē kritērijs: Atlasīt tikai pēc auto ražotāja!"
            render 'index'
            
        end

    end

    def list
        if ((params[:model] == "visi") && (params[:fuel] == "visi"))
            @list = Car.search_make(params)
        else
            @list = Car.search(params)
        end
    end

    def data
        @cars = Car.all
    end

end
