require 'json'
require 'open-uri'

include Facebook::Messenger

Facebook::Messenger::Profile.set({
  whitelisted_domains: [
    "https://3963afa2.ngrok.io",
    "https://www.snowbot-ai.com/",
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
  puts "-- postback"
  p postback

  if postback.payload == 'get_started'
    greet_current_user(postback)
    ask_for_the_mountain_chain(postback)
  elsif postback.payload == 'share_snowbot'
      postback.reply(
        attachment: {
          type: "template",
          payload: {
            template_type: "generic",
            elements: [
              {
                title: "Meet Snowbot 🤖",
                image_url: "https://www.snowbot-ai.com/facebook_share.jpg",
                subtitle: "... and book your ski trip in the most snowy ski resorts 😀",
                # default_action: {
                #   type: "web_url",
                #   url: "https://www.snowbot-ai.com",
                #   messenger_extensions: "true",
                #   webview_height_ratio: "compact" # full / tall
                # },
                buttons:[
                  {
                    type: "element_share",
                    share_contents: {
                      attachment: {
                        type: "template",
                        payload: {
                          template_type: "generic",
                          elements: [
                            {
                              title: "Meet Snowbot 🤖",
                              image_url: "https://www.snowbot-ai.com/facebook_share.jpg",
                              subtitle: "... and book your ski trip in the most snowy ski resorts 😀",
                              default_action: {
                                type: "web_url",
                                url: "https://www.snowbot-ai.com"
                              },
                              buttons:[
                                {
                                  type: "web_url",
                                  url: "https://www.messenger.com/t/509778846073901",
                                  title: "Start chatting with Snowbot now 🤖"
                                }
                              ]
                            }
                          ]
                        }
                      }
                    }
                  }
                ]
              }
            ]
          }
        }
    )
  end
end

Bot.on :message do |message|
  puts "-- message"
  p message

  user_psid = message.sender["id"]
  current_user = find_or_create_user(user_psid)

  case message.quick_reply

  when "mountain_chain" # STEP 1
    handle_mountain_chain_input(message, current_user)

  when "checkin" # STEP 3
    handle_checkin_input(message, current_user)

  when "checkout" # STEP 4
    handle_checkout_input(message, current_user)

  when "guests_number" # STEP 5 - FINAL
    handle_guests_number_input(message, current_user)

    search_offers(message, current_user)

  else
    unless message.messaging["message"]["attachments"].nil? # STEP 2
      handle_location_input(message, current_user)
    else
      message.reply(
        text: "Sorry #{current_user.first_name}, I didnt understand the request"
        )
    end
  end
end


# Create a new user or find an existing one
def find_or_create_user(user_psid)
  current_user = User.find_by(psid: user_psid)
  current_user ||= User.create(email: "#{user_psid}@mail.com", password: "123456", psid: user_psid)
end


def greet_current_user(postback)
  user_psid = postback.sender["id"]
  current_user = find_or_create_user(user_psid)

  url = "https://graph.facebook.com/v2.6/#{user_psid}?fields=first_name,last_name&access_token=#{ENV['ACCESS_TOKEN']}"
  infos_serialized = open(url).read
  user_infos = JSON.parse(infos_serialized)
  first_name = user_infos["first_name"]
  last_name = user_infos["last_name"]
  current_user.first_name = first_name
  current_user.last_name = last_name
  current_user.save

  postback.reply(
    attachment:{
      type:"image",
      payload:{
        # url:"https://media.giphy.com/media/3oxHQiF8d5gF1DqG2s/giphy.gif",
        url:"https://www.snowbot-ai.com/loader-welcome.gif",
        is_reusable:true
      }
    }
  )
  postback.reply(
    text: "Hello #{first_name} I am SnowBot 🤖 the ski specialist ! Ready to book your next trip? 🏂"
  )
  sleep(1)
end


def ask_for_the_mountain_chain(postback)
  domains = Domain.select(:mountain_chain).distinct.order(:mountain_chain)
  if domains.empty?
    sleep(1)
    postback.reply(
      text: 'Sorry we currently have no offers available, the bot is in maintenance. Come back later!')
  else
    postback.reply(
      text: 'Indicate the mountain chain where you\'d like to go skiing! 🏔️',
      quick_replies: domains.map do |domain|
        {
          content_type: 'text',
          title: "#{domain.mountain_chain.gsub("-"," ").upcase}",
          payload: 'mountain_chain'
        }
      end
    )
  end
end


def handle_mountain_chain_input(message, current_user)
  mountain_chain = message.text.downcase.gsub(" ","-")
  current_user.query = { mountain_chain: mountain_chain }
  current_user.save

  message.reply(
    text: 'Please indicate a precise location where you\'d like to pick up the rental car 📍',
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
    checkin = 1
  when "In 2 days"
    checkin = 2
    else # In 3 days
      checkin = 3
    end

    current_user.query = current_user.query.merge({ checkin: checkin })
    current_user.save

    message.reply(
      text: 'How many days are you planning to stay there?',
      quick_replies: [3, 5, 7, 10].map do |day|
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

  date_checkin = Date.today + current_user.query["checkin"].to_i

  checkin = date_checkin.strftime("%Y-%m-%d")
  checkout = (date_checkin + number_of_days).strftime("%Y-%m-%d")

  current_user.query = current_user.query.merge({ checkin: checkin })
  current_user.query = current_user.query.merge({ checkout: checkout })
  current_user.save

  message.reply(
    text: 'How many of you are going ?',
    quick_replies: [2, 3, 4, 5].map do |number|
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
  current_user.query = current_user.query.merge({ location: location })
  current_user.save

  message.reply(
    text: 'When do you want to leave ?',
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

def search_offers(message, current_user)
  message.reply(
    text: "#{current_user.first_name}, we are searching the best offers for you ... 🔥"
  )
  message.reply(
    attachment:{
      type:"image",
      payload:{
        # url:"https://media.giphy.com/media/xT1R9KkwhNKqWhoCo8/giphy.gif",
        url:"https://www.snowbot-ai.com/loader-search.gif",
        is_reusable:true
      }
    }
  )
  message.typing_on

  BotOffersCreationJob.perform_later(current_user.id)
end

