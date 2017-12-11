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
  p postback
  if postback.payload == 'get_started'

    user_psid = postback.sender["id"]

    # Create a new user or find an existing one
    current_user = User.where(psid: user_psid).first

    current_user = current_user.nil? ? User.create(email: "#{user_psid}@mail.com", password: "123456", psid: user_psid) : current_user

    url = "https://graph.facebook.com/v2.6/#{user_psid}?fields=first_name&access_token=#{ENV['ACCESS_TOKEN']}"
    infos_serialized = open(url).read
    user_infos = JSON.parse(infos_serialized)
    first_name = user_infos["first_name"]
    current_user.first_name = first_name
    current_user.save

    postback.reply(
      text: "Hello #{first_name} :) Ready to book your next ski trip? 🏂",
      )


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
end

Bot.on :message do |message|
  # binding.pry
  # p message
  user_psid = message.sender["id"]
  current_user = User.where(psid: user_psid).first
  case message.quick_reply
  when "mountain_chain"
    mountain_chain = message.text.downcase.gsub(" ","-")

    current_user.query = { mountain_chain: mountain_chain }
    current_user.save
    # current_user.save
    # puts mountain_chain
    # binding.pry
    message.reply(
      text: 'Please indicate a precise location where you\'d like to pick up the rental car 🚙',
      quick_replies:[
        {
          content_type: "location",
          payload: 'location'
        }
      ]
      )
  when "checkin"
    # checkin = message.text
    case message.text
    when "Tomorrow"
      date_checkin = Date.today + 1
    when "In 2 days"
      date_checkin = Date.today + 2
    else # In 3 days
      date_checkin = Date.today + 3
    end

    checkin = date_checkin.strftime("%Y-%m-%d")
    # current_user.query = { checkin: checkin }
    current_user.query = current_user.query.merge({ checkin: checkin })
    current_user.save

    message.reply(
      text: 'How many days are you planning to stay there?',
      quick_replies:[
        {
          title: '3 days',
          content_type: "text",
          payload: 'checkout'
          },
          {
            title: '5 days',
            content_type: "text",
            payload: 'checkout'
            },
            {
              title: '7 days',
              content_type: "text",
              payload: 'checkout'
            }
          ]
          )
  when "checkout"
    # checkout = message.text
    number_of_days = message.text.split.first.to_i
    checkout = (Date.today + number_of_days).strftime("%Y-%m-%d")

    current_user.query = current_user.query.merge({ checkout: checkout })
    current_user.save

    message.reply(
      text: 'How many people are going with you?',
      quick_replies:[
        {
          title: '2',
          content_type: "text",
          payload: 'guests_number'
          },
          {
            title: '3',
            content_type: "text",
            payload: 'guests_number'
            },
            {
              title: '4',
              content_type: "text",
              payload: 'guests_number'
            }
          ]
          )

  when "guests_number"
    guests_number = message.text
    current_user.query = current_user.query.merge({ guests_number: guests_number })
    current_user.save

    puts 'Finished asking questions'
    # p message
    # p current_user
    user_psid = message.sender["id"]
    current_user = User.where(psid: user_psid).first

    message.reply(
      text: "#{current_user.first_name}, we are searching for you the best offers ..."
      )
    message.typing_on

    offers_service = CreateOffersService.new(
      mountain_chain: current_user.query['mountain_chain'],
      start_city: "7 Rue Perronet 75007 Paris",
      checkin: [current_user.query['checkin']],
      checkout: [current_user.query['checkout']],
      guests_number: current_user.query['guests_number']
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
  else
    # p "location"
    # p message
    # checkin = message.messaging["message"]["text"]
    # location = message.messaging["message"]["attachments"][0]["payload"]["coordinates"]
    # location = location.nil? ? { "lat"=>48, "long"=>2 } : location
    unless message.messaging["message"]["attachments"].nil?
      location = message.messaging["message"]["attachments"][0]["payload"]["coordinates"]
      # p location {"lat"=>48.8648441, "long"=>2.3798836}
      current_user.query = current_user.query.merge({ location: location })
      current_user.save

      message.reply(
        text: 'When do you want to leave?',
        quick_replies:[
          {
            title: 'Tomorrow',
            content_type: "text",
            payload: 'checkin'
            },
            {
              title: 'In 2 days',
              content_type: "text",
              payload: 'checkin'
              },
              {
                title: 'In 3 days',
                content_type: "text",
                payload: 'checkin'
              }
            ]
            )
    else # Date checkin/checkout
      p message
      checkin = message.messaging["message"]["text"]
      # p "checkin"
      # p message
    end
  end

end
