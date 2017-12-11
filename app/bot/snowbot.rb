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


Bot.on :message do |message|
  if message.text == 'Alpes du Nord'
    message.reply(
      text: 'There are great resorts in the Alps'
    )
    sleep(0.3)
    message.reply(
      attachment: {
        type: 'image',
        payload: {
          url: 'https://comeonhitme.files.wordpress.com/2013/07/27716.jpg'
        }
      }
    )
    sleep(0.3)
    message.reply(
      text: "Our best resort today is the #{Domain.
      order(snow_depth_low: :desc).first.name} domain where there is #{Domain.
      order(snow_depth_low: :desc).first.snow_depth_low} cm of snow"
    )
    sleep(0.3)
    message.reply(
      text: 'Please indicate a precise location where you\'d like to pick up the rental car 🚙',
      quick_replies:[
        {
          "content_type":"location"
        }
      ]
    )
  else
    message.reply(
      text: 'There are great resorts in the South Alps'
    )
    sleep(0.3)
    message.reply(
      attachment: {
        type: 'image',
        payload: {
          url: 'https://comeonhitme.files.wordpress.com/2013/07/27716.jpg'
        }
      }
    )
    sleep(0.3)
    message.reply(
      text: "Our best resort today is the #{Domain.
      order(snow_depth_low: :desc).first.name} domain where there is #{Domain.
      order(snow_depth_low: :desc).first.snow_depth_low} cm of snow"
    )
    sleep(0.3)
    message.reply(
      text: 'Please indicate a precise location where you\'d like to pick up the rental car 🚙',
      quick_replies:[
        {
          "content_type":"location"
        }
      ]
    )
  end
end



Bot.on :message do |message|

    message.reply(
      {
        attachment: {
          type:"template",
          payload: {
            template_type:"generic",
            elements:[
              {
                title:"Welcome to Peter\'s Hats",
                # image_url:"https://www.snowbot-ai.com/assets/background-2cad98033199b80703f0d4c7e9e975559d7c28c9d60aa853bf6a0883c4a42005.jpg",
                image_url: image_tag offer.flat.domain.img_domain.first,
                subtitle:"We\'ve got the right hat for everyone.",
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
                    url:"https://10c178cd.ngrok.io",
                    title:"View Website"
                  },
                  {
                    type:"postback",
                    title:"Start Chatting",
                    payload:"DEVELOPER_DEFINED_PAYLOAD"
                  }
                ]
              },
              {
                title:"Welcome to Peter\'s Hats",
                image_url:"https://www.snowbot-ai.com/assets/background-2cad98033199b80703f0d4c7e9e975559d7c28c9d60aa853bf6a0883c4a42005.jpg",
                subtitle:"We\'ve got the right hat for everyone.",
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
                    url:"https://10c178cd.ngrok.io",
                    title:"View Website"
                  },
                  {
                    type:"postback",
                    title:"Start Chatting",
                    payload:"DEVELOPER_DEFINED_PAYLOAD"
                  }
                ]
              }
            ]
          }
        }
      }
    )
end

################################################################################################################


# Bot.on :message do |message|
#   if message.text == 'Alpes du Sud'
#     message.reply
#     (
#       p "test important"
#       #   {
#       #   attachment:{
#       #     type:"template",
#       #     payload:{
#       #       template_type:"generic",
#       #       elements:[
#       #          {
#       #           title:"Welcome to Peter\'s Hats",
#       #           image_url:"https://petersfancybrownhats.com/company_image.png",
#       #           subtitle:"We\'ve got the right hat for everyone.",
#       #           default_action: {
#       #             type: "web_url",
#       #             url: "https://petersfancybrownhats.com/company_image.png",
#       #             messenger_extensions: true,
#       #             webview_height_ratio: "tall",
#       #             fallback_url: "https://petersfancybrownhats.com/company_image.png"
#       #           },
#       #           buttons:[
#       #             {
#       #               type:"web_url",
#       #               url:"https://www.snowbot-ai.com",
#       #               title:"View Website"
#       #             },{
#       #               type:"postback",
#       #               title:"Start Chatting",
#       #               payload:"DEVELOPER_DEFINED_PAYLOAD"
#       #             }
#       #           ]
#       #         }
#       #       ]
#       #     }
#       #   }
#       # }
#     )
#   end
# end

# # Find the fb_user in the DB
# def find_fb_user(sender_id)
#   FbUser.find_by(sender_id: sender_id)
# end

# # Ask the fb_user if he is looking for a ski trip
# def send_welcome_message(fb_user)
#   Bot.deliver({
#     recipient: {
#       id: fb_user.sender_id
#     },
#     message: {
#       text: "Bonjour #{fb_user.first_name},\n\nbienvenue sur *Snowbot*!"
#     }
#   }, access_token: ENV.fetch('ACCESS_TOKEN'))
# end


