class Car < ApplicationRecord

    def self.populate_database

        path = "/home/me/Ruby On Rails/rails-treinings-data/test_data/sample_ta2020.txt"

        if File.exists?(path)
            puts "File found"
        end

        #populates also invalid objects -without value fields, needs validations
        File.open(path).each_with_index do |line, index|
            next if index == 0                                     
            args = line.split(',')                                                
            car_to_save = Car.new
            car_to_save.make = args[1]
            car_to_save.fuel = args[2]
            car_to_save.inspection = args[3]
            car_to_save.score = args[4]
            car_to_save.save
        end
    end


end
