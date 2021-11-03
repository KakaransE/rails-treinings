require "httparty"
require "nokogiri"


make = "Audi"
model = "A3"
response = HTTParty.get("https://flickr.com/search/?text=#{make}%20#{model}") # search string for pictures of specified make/model in flickr.com
parsed_html = Nokogiri::HTML(response.body) # getting html body
car_photos = parsed_html.css(".photo-list-photo-view") # gets elements from class .photo-list-photo-view

photo_attributes = []  
car_photos.each_with_index do |car, index|      # gets first element of previously found class
    break if index >= 1
    photo_attributes.push(car.attribute("style").value) # cant figure out how to get further than this using httparty and nokogiri, next need to use string methods
end

 info_string = photo_attributes.first.split(';').last # spliting vallues, of supposed xml element(string)?
 offset = info_string.index('url') # position (offset) where 'url' starts (needs to add 6 places to compensate for 'url(//')
p url_string = info_string[(6+offset)..-2] # cropps off front and last bracket










