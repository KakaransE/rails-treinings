
path = "/home/me/Ruby On Rails/rails-treinings-data/test_data/ta2020e.lst"

# Checking if data file exists at given path
if File.exists?(path)
    puts "File found"
end

# Proof of concept for data parser
data = []
File.open(path).each_with_index do |line, index|
    break if index >= 10                                    # for test purposes reading only first 10 lines
    next if index == 0                                      # skips first line because of column names
    data[index-1] = line.split(',')                         # index-1 fix so array[0] element would not be empty

    data[index-1].each do |element|                         # iterating through line elements stripping whitespaces
        element.strip!
    end

end

# prints array of read values
data.each do |element|  
    p element
end






