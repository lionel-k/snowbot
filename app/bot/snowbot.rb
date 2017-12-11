# require "facebook/messenger"

include Facebook::Messenger
# Facebook::Messenger::Subscriptions.subscribe(access_token: ENV.fetch("ACCESS_TOKEN"))
Facebook::Messenger::Profile.set({
  whitelisted_domains: ["https://10c178cd.ngrok.io",
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
  # sender_id = postback.sender['id']
  # fb_user = find_fb_user(sender_id)
  # p "test"
  if postback.payload == 'get_started'
    # send_welcome_message(fb_user)
    postback.reply(
      text: 'Ready to book your next ski trip? 🏂',
      )
    sleep(0.3)
    postback.reply(
      text: 'Indicate the mountain chain where you\'d like to go skiing!',
      quick_replies: [
        {
          content_type: 'text',
          title: 'Alpes du Nord',
          payload: 'alpes_nord'
          },
          {
            content_type: 'text',
            title: 'Alpes du Sud',
            payload: 'alpes_sud'
            },
            {
              content_type: 'text',
              title: 'Pyrénées',
              payload: 'pyrenees'
            }
          ]
          )
  end
end


# Bot.on :message do |message|
#   if message.text == 'Alpes du Nord'
#     message.reply(
#       text: 'There are great resorts in the Alps'
#     )
#     sleep(0.3)
#     message.reply(
#       attachment: {
#         type: 'image',
#         payload: {
#           url: 'https://comeonhitme.files.wordpress.com/2013/07/27716.jpg'
#         }
#       }
#     )
#     sleep(0.3)
#     message.reply(
#       text: "Our best resort today is the #{Domain.
#       order(snow_depth_low: :desc).first.name} domain where there is #{Domain.
#       order(snow_depth_low: :desc).first.snow_depth_low} cm of snow"
#     )
#     sleep(0.3)
#     message.reply(
#       text: 'Please indicate a precise location where you\'d like to pick up the rental car 🚙',
#       quick_replies:[
#         {
#           "content_type":"location"
#         }
#       ]
#     )
#   else
#     message.reply(
#       text: 'There are great resorts in the South Alps'
#     )
#     sleep(0.3)
#     message.reply(
#       attachment: {
#         type: 'image',
#         payload: {
#           url: 'https://comeonhitme.files.wordpress.com/2013/07/27716.jpg'
#         }
#       }
#     )
#     sleep(0.3)
#     message.reply(
#       text: "Our best resort today is the #{Domain.
#       order(snow_depth_low: :desc).first.name} domain where there is #{Domain.
#       order(snow_depth_low: :desc).first.snow_depth_low} cm of snow"
#     )
#     sleep(0.3)
#     message.reply(
#       text: 'Please indicate a precise location where you\'d like to pick up the rental car 🚙',
#       quick_replies:[
#         {
#           "content_type":"location"
#         }
#       ]
#     )
#   end
# end



Bot.on :message do |message|

    message.reply(
      {
        attachment: {
          type:"template",
          payload: {
            template_type:"generic",
            elements:[
              {
                title: Offer.first.domain.name + " | " + Offer.first.flat_title[0..29] + "... | " + Offer.first.car_title,
                image_url: Offer.first.domain.img_domain,
                subtitle: Offer.first.domain.mountain_chain + " | " + " Snow at top : " + Offer.first.domain.snow_depth_high.to_s + "cm" + " | " + "Flat rating: " + Offer.first.flat_ratings.round.to_s,
                default_action: {
                  type: "web_url",
                  url: "https://10c178cd.ngrok.io/",
                  messenger_extensions: true,
                  webview_height_ratio: "tall",
                  fallback_url: "https://10c178cd.ngrok.io/"
                },
                buttons:[
                  {
                    type:"web_url",
                    url:"https://10c178cd.ngrok.io/offers?utf8=✓&start_city=16+villa+gaudelet+paris&mountain_chain=alpes-du-nord&checkin%5B%5D=2017-12-23&checkout%5B%5D=2017-12-30&guests_number=5&commit=Search",
                    title:"Pack in details"
                  },
                  {
                    type:"web_url",
                    url: "https://10c178cd.ngrok.io/orders/5/payments/new",
                    title:"Book this trip !"
                    # payload:"DEVELOPER_DEFINED_PAYLOAD"
                  }
                ]
              },
              {
                title: Offer.second.domain.name + ", " + Offer.second.domain.mountain_chain,
                # image_url:"https://www.snowbot-ai.com/assets/background-2cad98033199b80703f0d4c7e9e975559d7c28c9d60aa853bf6a0883c4a42005.jpg",
                image_url: Offer.second.domain.img_domain,
                subtitle: Offer.second.flat_title + " | " + Offer.second.car_title,
                default_action: {
                  type: "web_url",
                  url: "https://10c178cd.ngrok.io/",
                  messenger_extensions: true,
                  webview_height_ratio: "tall",
                  fallback_url: "https://10c178cd.ngrok.io/"
                },
                buttons:[
                  {
                    type:"web_url",
                    url:"https://10c178cd.ngrok.io/offers?utf8=✓&start_city=16+villa+gaudelet+paris&mountain_chain=alpes-du-nord&checkin%5B%5D=2017-12-23&checkout%5B%5D=2017-12-30&guests_number=5&commit=Search",
                    title:"Pack in details"
                  },
                  {
                    type:"web_url",
                    url: "https://10c178cd.ngrok.io/orders/6/payments/new",
                    title:"Book this trip !"
                    # payload:"DEVELOPER_DEFINED_PAYLOAD"
                  }
                ]
              },
              {
                title: Offer.third.domain.name + ", " + Offer.third.domain.mountain_chain,
                # image_url:"https://www.snowbot-ai.com/assets/background-2cad98033199b80703f0d4c7e9e975559d7c28c9d60aa853bf6a0883c4a42005.jpg",
                image_url: Offer.third.domain.img_domain,
                subtitle: Offer.third.flat_title + " | " + Offer.third.car_title,
                default_action: {
                  type: "web_url",
                  url: "https://10c178cd.ngrok.io/",
                  messenger_extensions: true,
                  webview_height_ratio: "tall",
                  fallback_url: "https://10c178cd.ngrok.io/"
                },
                buttons:[
                  {
                    type:"web_url",
                    url:"https://10c178cd.ngrok.io/offers?utf8=✓&start_city=16+villa+gaudelet+paris&mountain_chain=alpes-du-nord&checkin%5B%5D=2017-12-23&checkout%5B%5D=2017-12-30&guests_number=5&commit=Search",
                    title:"Pack in details"
                  },
                  {
                    type:"web_url",
                    url: "https://10c178cd.ngrok.io/orders/7/payments/new",
                    title:"Book this trip !"
                    # payload:"DEVELOPER_DEFINED_PAYLOAD"
                  }
                ]
              },
            ]
          }
        }
      }
    )
end


