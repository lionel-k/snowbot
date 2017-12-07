include Facebook::Messenger

Bot.on :message do |message|
  message.typing_on
  if message.text == 'You are!'
    message.reply(text: 'Great')
  else
    message.reply(
        text: 'Human, who is your favorite bot?',
      quick_replies: [
        {
          content_type: 'text',
          title: 'You are!',
          payload: 'HARMLESS'
        }
      ]
    )
  end
end

# message.reply(
#   attachment: {
#     type: 'image',
#     payload: {
#       url: 'https://vignette.wikia.nocookie.net/clubpenguin/images/3/33/Wispy_Clouds_Icon.png/revision/latest/scale-to-width-down/640?cb=20140806145455'
#     }


  # message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  # message.sender      # => { 'id' => '1008372609250235' }
  # message.seq         # => 73
  # message.sent_at     # => 2016-04-22 21:30:36 +0200
  # message.text        # => 'Hello, bot!'
  # message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]
