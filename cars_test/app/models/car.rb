class Car < ApplicationRecord

    validates :make, presence: true
    validates :fuel, presence: true
    validates :inspection, presence: true
    validates :score, presence: true

    def self.populate_database

        path = "/home/me/Ruby On Rails/rails-treinings-data/test_data/sample_ta2020.txt"

        if File.exists?(path)
            puts "File found"
        end

        #populates also invalid objects -without value fields, needs validations
        File.open(path).each_with_index do |line, index|
            next if index == 0                                     
            args = line.split(',')   

            car_to_save = Car.new({
            make: args[1].strip,
            fuel: args[2].strip,
            inspection: args[3].strip,
            score: args[4].strip
            })

            car_to_save.save if car_to_save.valid?
            # could log or count how many records were not saved
        end
    end


end
