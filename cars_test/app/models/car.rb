class Car < ApplicationRecord

    validates :make, presence: true
    validates :fuel, presence: true
    validates :inspection, presence: true
    validates :score, presence: true

    def self.populate_database

        path = "/home/me/Ruby On Rails/rails-treinings-data/test_data/ta2020e.lst"

        if File.exists?(path)
            puts "File found"
        end

        File.open(path).each_with_index do |line, index|
            next if index == 0 
            break if index == 10000 #limiting amount of data thats been read                                    
            args = line.split(',')   

            car_to_save = Car.new({
            make: args[1].strip.upcase,
            fuel: args[2].strip.upcase,
            inspection: args[3].strip.upcase,
            score: args[4].strip.upcase
            })

            car_to_save.save if car_to_save.valid?
            # could log or count how many records were not saved
        end
    end

    def self.search(params) # DB query to look for cars that meet search params: make, model, fuel
        Car.where('make LIKE ? AND make LIKE ? AND fuel LIKE ?', 
            "%#{params[:make].upcase}%", "%#{params[:model].upcase}%", "%#{params[:fuel].upcase}%")
    end

    def self.search_make(params) # DB query to look for cars that meet search params: make, model, fuel
        Car.where('make LIKE ?', "%#{params[:make].upcase}%")
    end

    def self.get_fuel_types
        fuel_types = []
        (Car.select(:fuel).distinct).each do |car|
            fuel_types.push(car[:fuel])
        end
        return fuel_types
    end


    def self.weighted_average(list) # calculate weighted average value for technical inspection results, needs to pass Car objects from Car.search()
        scores = [0,0,0,0]
        list.each do |car| 
            scores[car[:score].to_i] += 1
        end
        average = (scores[1].to_f + (scores[2]*2).to_f + (scores[3]*3).to_f) / list.size
    end

    def self.graph_data_basic(list)    # returns value pairs for basic inspection graph
        scores = [[0, 0], [1, 0], [2, 0], [3, 0]] #not the most gracefull way, but might be faster than creating additional loop
        list.each do |car| 
            if car[:inspection].eql?("PAMATPĀRBAUDE")
                scores[car[:score].to_i][1] += 1 
            end
        end
        return scores
    end

    def self.graph_data_repeated(list)  # returns value pairs for repeated inspection graph
        scores = [[0, 0], [1, 0], [2, 0], [3, 0]]
        list.each do |car| 
            if car[:inspection].eql?("ATKĀRTOTA")
                scores[car[:score].to_i][1] += 1 
            end
        end
        return scores
    end

    def self.chart_max(values) # calculates y axis max value rounded down to 10s
        max = 0
        values.each do |value_pair|
            max = value_pair[1] if max < value_pair[1]
        end
        max /= 10 # drops the last digit
        max = (max*10)+10

    end


end
