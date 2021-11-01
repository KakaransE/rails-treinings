class Car
    attr_accessor :make, :fuel, :type, :score

    def initialize(make, fuel, type, score)
        @make = make
        @fuel = fuel
        @type = type
        @score = score
    end

    def to_s
        puts "Car: #{@make}, #{@fuel}, #{@type}, #{@score}"
    end
end

path = "/home/me/Ruby On Rails/rails-treinings-data/test_data/sample_ta2020.txt"

if File.exists?(path)
    puts "File found"
end

#writes Car objects in data array that are ready for saving in database
data = []
File.open(path).each_with_index do |line, index|
    next if index == 0                                      # skips first line because of column names
    args = line.split(',')                         
    data.push(Car.new(args[1].strip, args[2].strip, args[3].strip, args[4].strip)) 

end

data.each do |car|
    car.to_s
end