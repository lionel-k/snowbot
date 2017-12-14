require 'json'
require 'open-uri'

include Facebook::Messenger

class BotOffersCreationJob < ApplicationJob
  queue_as :bot

  def perform(current_user_id)
    current_user = User.find(current_user_id)
    message_sender_id = current_user.psid
    guests_number = current_user.query['guests_number'].to_i
    checkin = Date.parse(current_user.query['checkin'])
    checkout = Date.parse(current_user.query['checkout'])
    diff_days = checkout.mjd - checkin.mjd

    offers_service = CreateOffersService.new(
      mountain_chain: current_user.query['mountain_chain'],
      start_location: current_user.query['location'],
      checkin: [current_user.query['checkin']],
      checkout: [current_user.query['checkout']],
      guests_number: current_user.query['guests_number'],
      user: current_user
      )

    offers = offers_service.call

    if offers.any?
      Bot.deliver({
        recipient: {
          id: message_sender_id
        },
        message: {
          text: 'Here are the best options we have found for you 😀'
        }
      }, access_token: ENV['ACCESS_TOKEN'])

      sleep(1)

      Bot.deliver({
        recipient: {
          id: message_sender_id
        },
        message: {
          attachment: {
            type:"template",
            payload: {
              template_type:"generic",
              elements:
              # offers.map do |offer|
              #   {
              #     title: offer.domain.name + " | " + offer.flat_title[0..29] + "... | " + offer.car_title,
              #     image_url: offer.domain.img_domain,
              #     subtitle: offer.domain.mountain_chain + " | " + " Snow at top : " + offer.domain.snow_depth_high.to_s + "cm" + " | " + "Flat rating: " + offer.flat_ratings.round.to_s,
              #     default_action: {
              #       type: "web_url",
              #       url: "https://www.snowbot-ai.com/",
              #       messenger_extensions: true,
              #       webview_height_ratio: "tall",
              #       fallback_url: "https://www.snowbot-ai.com/"
              #     },
              #     buttons:[
              #       {
              #         type:"web_url",
              #         url:"https://www.snowbot-ai.com/offers/#{offer.id}",
              #         title:"See more details"
              #       }
              #     ]
              #   }
              # end
                offers.map do |offer|
                  {
                    # binding.pry
                    title: "Stay in #{offer.domain.name} for #{offer.total_price(diff_days).fdiv(guests_number).round}€/pers, #{offer.domain.snow_depth_high}cm of ❄❄ at top",
                    image_url: offer.domain.img_domain,
                    subtitle: "Flat rating #{"⭐" * offer.flat_ratings.round} - Bedrooms #{"🛏️" * offer.flat_bedrooms_nb} - Car #{offer.car_title[0..19]}",
                    # default_action: {
                    #   type: "web_url",
                    #   url: "https://www.snowbot-ai.com/",
                    #   messenger_extensions: true,
                    #   webview_height_ratio: "tall",
                    #   fallback_url: "https://www.snowbot-ai.com/"
                    # },
                    buttons:[
                      {
                        type:"web_url",
                        url:"https://www.snowbot-ai.com/offers/#{offer.id}",
                        title:"See more details"
                      }
                    ]
                  }
                end
            }
          }
        }
      }, access_token: ENV['ACCESS_TOKEN'])
    else
      Bot.deliver({
        recipient: {
          id: message_sender_id
        },
        message: {
          text: 'Sorry, we could not find any offers for your criteria :-( Would you like to make another search? Press the restart button!'
        }
      }, access_token: ENV['ACCESS_TOKEN'])
    end
  end
end
