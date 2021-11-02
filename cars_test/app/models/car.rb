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

        #populates also invalid objects -without value fields, needs validations
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

    def self.search(params)
        Car.where('make LIKE ? AND make LIKE ? AND fuel LIKE ?', 
            "%#{params[:make].upcase}%", "%#{params[:model].upcase}%", "%#{params[:fuel].upcase}%")
    end


end
