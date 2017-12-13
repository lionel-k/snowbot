require 'open-uri'
require 'nokogiri'

class UpdateDomainJob < ApplicationJob

  queue_as :default

  def perform(domain_id)
    domain = Domain.find(domain_id)
    p "--------------------------------------------------"
    p domain.name
    url_snow = "https://www.skiinfo.fr/#{domain.mountain_chain}/#{domain.name_url}/bulletin-neige.html"
    html_file = open(url_snow).read
    html_doc = Nokogiri::HTML(html_file)

    element = html_doc.search('.elevation.lower .bluePill').first
    puts "Snow depth at the Resort (cm) : "
    p domain.snow_depth_low = element.text.strip.split('cm')[0].to_i

    element2 = html_doc.search('.elevation.upper .bluePill').first
    puts "Snow depth at the Domain's top (cm) : "
    p domain.snow_depth_high = element2.text.strip.split('cm')[0].to_i
    p "- - - - - - - - - - - - - - - - - - - - - - -"

    url_weather = "https://www.skiinfo.fr/#{domain.mountain_chain}/#{domain.name_url}/meteo-a-10-jours.html"
    html_file_weather = open(url_weather).read
    html_doc_weather = Nokogiri::HTML(html_file_weather)
    p Date.new(Time.now.year, Time.now.month, Time.now.day)
    html_doc_weather.search('.weather')[0...1].each do |element|
      condition = element.children[1].attributes['class'].value.split(' ').drop(1)[0]
      p domain.is_sunny = condition
      p domain.is_sunny = condition == "sun"  ? true : false
    end

    url_photo = "https://www.skiinfo.fr/#{domain.mountain_chain}/#{domain.name_url}/station-de-ski.html"
    html_file_photo = open(url_photo).read
    html_doc_photo = Nokogiri::HTML(html_file_photo)
    element_pic = html_doc_photo.search('#resort_image')
    p domain.img_domain = element_pic.children[1].attributes['src'].value

    domain.save
    p "- - - - - - - - - - - - - - - - - - - - - - -"
    forecast = []
    html_doc_weather.search('.weather')[1..4].each do |element|
      condition = element.children[1].attributes['class'].value.split(' ').drop(1)[0]
      forecast << condition
    end
    domain.forecast_data = forecast.join("|")
    domain.save
    p domain.forecast_data
  end
end
