class Car # This would be model in rails application
    attr_accessor :make, :fuel, :type, :score

    def initialize(make, fuel, type, score)
        @make = make
        @fuel = fuel
        @type = type
        @score = score
    end

    def to_s # Just a helper for visualization in cosnole
        puts "Car: #{@make}, #{@fuel}, #{@type}, #{@score}"
    end
end

path = "/home/me/Ruby On Rails/rails-treinings-data/test_data/sample_ta2020.txt" # path for data file

if File.exists?(path) # check if file is found
    puts "File found"
end

#writes Car objects in data array that are ready for saving in database
data = [] 
File.open(path).each_with_index do |line, index|
    next if index == 0                                      # skips first line because of column names
    args = line.split(',')                         # splits data at ',' (.csv files)
    data.push(Car.new(args[1].strip, args[2].strip, args[3].strip, args[4].strip)) # strips whitespaces

end

data.each do |car|  # iterates through parsed data set
    car.to_s
end