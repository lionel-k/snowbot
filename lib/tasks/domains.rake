require 'open-uri'
require 'nokogiri'

namespace :domains do
  desc "Update domains"
  task :update_all => :environment do
    # Domain.all.each do |domain|
      domain = Domain.first
      url_snow = "https://www.skiinfo.fr/#{domain.mountain_chain}/#{domain.name_url}/bulletin-neige.html"
      html_file = open(url_snow).read
      html_doc = Nokogiri::HTML(html_file)
      # binding.pry
      html_doc.search('.elevation.lower .bluePill').each do |element|
        puts "Snow depth at the Resort : "
        p domain.snow_depth_low = element.text.strip
        html_doc.search('.elevation.upper .bluePill').each do |element|
          puts "Snow depth at the Domain's top : "
          p domain.snow_depth_high = element.text.strip

          url_weather = "https://www.skiinfo.fr/#{domain.mountain_chain}/#{domain.name_url}/meteo-a-10-jours.html"
          html_file_weather = open(url_weather).read
          html_doc_weather = Nokogiri::HTML(html_file_weather)
          html_doc_weather.search('.rsSlide').each do |element|
            p domain.is_sunny = element.text.strip


        domain.save
      end
    end

  end
end





