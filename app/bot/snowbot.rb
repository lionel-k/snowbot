include Facebook::Messenger

Bot.on :postback do |postback|
  if postback.payload == 'get_started'
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
  end
end
