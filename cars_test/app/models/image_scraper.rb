class ImageScraper < ApplicationRecord

    require "httparty"
    require "nokogiri"
    
    def self.get_image(make, model)
        
        # This block gets flickr.com search page, parses html and gets .photo-list-photo-view elements
        response = HTTParty.get("https://flickr.com/search/?text=#{make}%20#{model}") 
        parsed_html = Nokogiri::HTML(response.body) 
        car_photos = parsed_html.css(".photo-list-photo-view") 
        
        # Next get first element of .photo-list-photo-view class and get style atribute
        # Cant figure out how to get further than this using httparty and nokogiri, because of this use string methods
        photo_attributes = []  
        car_photos.each_with_index do |car, index|      
            break if index >= 1
            photo_attributes.push(car.attribute("style").value) 
        end
        
        # Spliting element by ';' gets last element, matches for 'url' ands cuts out url for image
        # Should probably use regex and not split in the first place
        info_string = photo_attributes.first.split(';').last 
        offset = info_string.index('url') 
        url_string = info_string[(6+offset)..-2] 
        return "https://#{url_string}"
    end

end
