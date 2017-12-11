require 'json'
require 'open-uri'

include Facebook::Messenger

Facebook::Messenger::Profile.set({
  whitelisted_domains: ["https://859a9313.ngrok.io",
    "https://www.snowbot-ai.com",
    "https://odis.homeaway.com",
    "https://drivy.imgix.net",
    "https://img1.onthesnow.com",
    "https://img2.onthesnow.com",
    "https://img3.onthesnow.com",
    "https://img4.onthesnow.com",
    "https://img5.onthesnow.com",
    "https://img6.onthesnow.com"]
    }, access_token: ENV['ACCESS_TOKEN'])

Bot.on :postback do |postback|
  if postback.payload == 'get_started'

    greet_current_user(postback)

    ask_for_the_mountain_chain(postback)

  end
end

Bot.on :message do |message|

  user_psid = message.sender["id"]
  current_user = User.where(psid: user_psid).first
  case message.quick_reply

  when "mountain_chain"
    handle_mountain_chain_input(message, current_user)

  when "checkin"
    handle_checkin_input(message, current_user)

  when "checkout"
    handle_checkout_input(message, current_user)

  when "guests_number"
    handle_guests_number_input(message, current_user)

    display_waiting_message(message, current_user)
    display_offers(message, current_user)

  else
    unless message.messaging["message"]["attachments"].nil?
      handle_location_input(message, current_user)
    else
      message.reply(
        text: "Sorry #{current_user.first_name}. I didnt understand the request",
        )

    end
  end

end


def handle_mountain_chain_input(message, current_user)
  mountain_chain = message.text.downcase.gsub(" ","-")

  current_user.query = { mountain_chain: mountain_chain }
  current_user.save

  message.reply(
    text: 'Please indicate a precise location where you\'d like to pick up the rental car 🚙',
    quick_replies:[
      {
        content_type: "location",
        payload: 'location'
      }
    ]
    )
end

def handle_checkin_input(message, current_user)
  case message.text
  when "Tomorrow"
    date_checkin = Date.today + 1
  when "In 2 days"
    date_checkin = Date.today + 2
    else # In 3 days
      date_checkin = Date.today + 3
    end

    checkin = date_checkin.strftime("%Y-%m-%d")
    current_user.query = current_user.query.merge({ checkin: checkin })
    current_user.save

    message.reply(
      text: 'How many days are you planning to stay there?',
      quick_replies: [3, 5, 7, 9].map do |day|
        {
          title: "#{day} days",
          content_type: "text",
          payload: 'checkout'
        }
      end
      )
end

def handle_checkout_input(message, current_user)
  number_of_days = message.text.split.first.to_i
  checkout = (Date.today + number_of_days).strftime("%Y-%m-%d")

  current_user.query = current_user.query.merge({ checkout: checkout })
  current_user.save

  message.reply(
    text: 'How many people are going with you?',
    quick_replies: [2, 3, 4].map do |number|
      {
        title: "#{number}",
        content_type: "text",
        payload: 'guests_number'
      }
    end

    )
end


def handle_location_input(message, current_user)
  location = message.messaging["message"]["attachments"][0]["payload"]["coordinates"]
  # p location {"lat"=>48.8648441, "long"=>2.3798836}
  current_user.query = current_user.query.merge({ location: location })
  current_user.save

  message.reply(
    text: 'When do you want to leave?',
    quick_replies: ['Tomorrow', 'In 2 days', 'In 3 days'].map do |duration|
      {
        title: "#{duration}",
        content_type: "text",
        payload: 'checkin'
      }
    end
    )
end


def handle_guests_number_input(message, current_user)
  guests_number = message.text
  current_user.query = current_user.query.merge({ guests_number: guests_number })
  current_user.save
end


def display_waiting_message(message, current_user)
  message.reply(
    text: "#{current_user.first_name}, we are searching for you the best offers ... :)"
    )
  message.typing_on
end


def display_offers(message, current_user)
  offers_service = CreateOffersService.new(
        mountain_chain: current_user.query['mountain_chain'],
        start_city: "7 Rue Perronet 75007 Paris",
        checkin: [current_user.query['checkin']],
        checkout: [current_user.query['checkout']],
        guests_number: current_user.query['guests_number'],
        user: current_user
        )

      offers = offers_service.call

  message.reply(
  {
    attachment: {
      type:"template",
      payload: {
        template_type:"generic",
        elements:
        offers.map do |offer|
          {
            title: offer.domain.name + " | " + offer.flat_title[0..29] + "... | " + offer.car_title,
            image_url: offer.domain.img_domain,
            subtitle: offer.domain.mountain_chain + " | " + " Snow at top : " + offer.domain.snow_depth_high.to_s + "cm" + " | " + "Flat rating: " + offer.flat_ratings.round.to_s,
            default_action: {
              type: "web_url",
              url: "https://859a9313.ngrok.io/",
              messenger_extensions: true,
              webview_height_ratio: "tall",
              fallback_url: "https://859a9313.ngrok.io/"
              },
              buttons:[
                {
                  type:"web_url",
                  url:"https://859a9313.ngrok.io/offers/#{offer.id}",
                  title:"Pack in details"
                  },
                  {
                    type:"web_url",
                    url: "https://859a9313.ngrok.io/orders/5/payments/new",
                    title:"Book this trip !"
                      # payload:"DEVELOPER_DEFINED_PAYLOAD"
                    }
                  ]
                }
              end

            }
          }
        }
  )
end


def ask_for_the_mountain_chain(postback)
  postback.reply(
    text: 'Indicate the mountain chain where you\'d like to go skiing!',
    quick_replies: Domain.select(:mountain_chain).distinct.map do |domain|
      {
        content_type: 'text',
        title: "#{domain.mountain_chain.gsub("-"," ").upcase}",
        payload: 'mountain_chain'
      }
    end

    )
end


def greet_current_user(postback)
  user_psid = postback.sender["id"]

  # Create a new user or find an existing one
  current_user = User.where(psid: user_psid).first

  current_user = current_user.nil? ? User.create(email: "#{user_psid}@mail.com", password: "123456", psid: user_psid) : current_user

  url = "https://graph.facebook.com/v2.6/#{user_psid}?fields=first_name,last_name&access_token=#{ENV['ACCESS_TOKEN']}"
  infos_serialized = open(url).read
  user_infos = JSON.parse(infos_serialized)
  first_name = user_infos["first_name"]
  last_name = user_infos["last_name"]
  current_user.first_name = first_name
  current_user.last_name = last_name
  current_user.save

  postback.reply(
    text: "Hello #{first_name} :) Ready to book your next ski trip? 🏂",
  )
end
