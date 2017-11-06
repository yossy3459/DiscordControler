require 'discordrb'

bot = Discordrb::Bot.new token: 'Mzc2Njk3MjkwNzQxNTE0MjQw.DOCUHA.0J-_6YaBMyL37MKjdDRRvG3AtpU', client_id: 376697290741514240

bot.message(with_text: "Hey Bot!") do |event|
  event.respond "Hi, #{event.user.name}!"
end

bot.run
