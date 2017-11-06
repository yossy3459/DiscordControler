require 'discordrb'
require "./ApiData"

class DiscordControler

	def initialize(data)
		# 属性初期化
		@bot = data.bot
		@botID = data.botID
		@botToken = data.bot.token
		@serverID = data.serverID
		@textChannelID = data.textChannelID
		@voiceChannelID = data.voiceChannelID
		@userID = data.userID

		# bot: 非同期で開始
		@bot.run :async

		# インスタンス化
		@server = @bot.server(@serverID)
		@textChannel = @bot.channel(@textChannelID)
		@voiceChannel = @bot.channel(@voiceChannelID)
		@user = @bot.user(@userID)
		@member = @bot.member(@serverID, @userID)

		# BotをVoice Channelへ接続
		@bot.voice_connect(@voiceChannel)
	end

	# SendMesseage: キーボードから入力したメッセージをDiscordに投稿
	def sendMessage
		print "Send: "
		message = gets

		# @param [int] channel.id Discord channelのID
		# @param [string] message 送信するメッセージ
		@bot.send_message(@textChannelID, message)
	end

	# sendMessageFromParam
	def sendTemporaryMessage
		print "Send: "
		message = gets

		# @param [int] channel.id Discord channelのID
		# @param [string] message 送信するメッセージ
		@bot.send_temporary_message(@textChannelID, message, 0.0001)
	end

	# micMute: Discordのマイクをミュートにする
	# @param [string] @bot.token Discord botのトークン
	# @param [int] @serverID Discord serverのID
	# @param [int] @userID Discord userのID
	# @param [bool] mute ミュートするか否か
	def micMute
		@member.server_mute
	end

	# micUnMute: Discordのマイクのミュートを解除する
	# @param [string] @bot.token Discord botのトークン
	# @param [int] @serverID Discord serverのID
	# @param [int] @userID Discord userのID
	# @param [bool] mute ミュートするか否か
	def micUnMute
		@member.server_unmute
	end

end
