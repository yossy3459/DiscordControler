require 'discordrb'
require 'configatron'
require_relative 'config.rb'

# DiscordApiData: Discordのトークンや各種IDをストアするクラス
class DiscordApiData

	# アクセサ
	attr_reader :bot, :botID, :serverID, :textChannelID, :voiceChannelID, :userID, :musicBotID

	def initialize
		@botToken = configatron.token
		@botID = 376779960108711958

		# Discord API用パラメータを入力
		# BOT Token & Client ID
		@bot = Discordrb::Bot.new(
			token: @botToken,
			client_id: @botClientID
		)

		# Server ID
		@serverID = 372643342594605057  # あるでぃーの

		# Text Channel ID
		@textChannelID = 372643342594605059

		# Voice Channel ID
		@voiceChannelID = 372643342594605061

		# User ID
		@userID = 249901088310820865

		# Music Bot ID
		@musicBotID = 380198711705206785
	end

end
